//
//  PunaList.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

/**
 This class is a custom UITableView to PunaUI
*/
@objc public class PunaList: UIView {

    /// Set the delegate to use own methods
    @objc public weak var delegate: PunaListDelegate?

    /// Set the dataSource to use own methods
    @objc public weak var dataSource: PunaListDataSource?

    /// Set the separator style, default value .none
    @objc public var separatorStyle: PunaSeparatorStyle = .none

    /// Set the selection style, default value .default
    @objc public var selectionStyle: PunaSelectionStyle = .defaultStyle

    /// Set the list type, default value simple
    @objc public var listType: PunaCellType = .simple

    /// Set the list size, default value medium
    @objc public var size: PunaListSize = .medium

    /// This method reload the data
    @objc public func reloadData() {
        self.tableView.reloadData()
    }

    @objc public init(type: PunaCellType = .simple) {
        super.init(frame: .zero)
        self.listType = type
        setup()
    }

    private var tableView: UITableView = UITableView()
    private var internalDataSource: PunaListTableViewDataSource?
    // swiftlint:disable weak_delegate
    private var internalDelegate: PunaListTableViewDelegate?
    // swiftlint:enable weak_delegate

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    /// Setup delegates and register UITableViewCell on the UITableView
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.tableView.separatorStyle = .none
        self.tableView.separatorInset.left = UIScreen.main.bounds.width
        self.tableView.backgroundColor = PunaStyleSheetManager.styleSheet.bgColorWhite
        setupDelegates()
        registerNib()
        drawContentView()
    }

    private func setupDelegates() {
        internalDataSource = PunaListTableViewDataSource(listProtocol: self)
        internalDelegate = PunaListTableViewDelegate(listProtocol: self)
        self.tableView.delegate = internalDelegate
        self.tableView.dataSource = internalDataSource
    }

    private func registerNib() {
        tableView.register(UINib(nibName: "PunaListSimpleViewCell",
                                 bundle: PunaBundle.bundle()),
                           forCellReuseIdentifier: "PunaListSimpleViewCell")
        tableView.register(UINib(nibName: "PunaListChevronViewCell",
                                 bundle: PunaBundle.bundle()),
                           forCellReuseIdentifier: "PunaListChevronViewCell")
        tableView.register(UINib(nibName: "PunaListTimePickerViewCell",
                                 bundle: PunaBundle.bundle()),
                           forCellReuseIdentifier: "PunaListTimePickerViewCell")
    }

    private func drawContentView() {
        addSubview(self.tableView)
        self.tableView.pinToSuperview()
    }
}

/// Use (UITableViewDelegate and UITableViewDatasource) in a independent protocol
extension PunaList: PunaListProtocol {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections(self) ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.PunaList(self, numberOfRowsInSection: section) ?? 0
    }

    func cellForRowAt(indexPath: IndexPath) -> PunaListCell {
        guard let customCell = dataSource?.PunaList(self, cellForRowAt: indexPath),
              customCell.type == listType else {
            fatalError("Cell type not allowed, should be \(listType.toString()) type")
        }
        customCell.updateSize(size: self.size)
        return customCell
    }

    func getSeparatorStyle() -> PunaSeparatorStyle {
        return self.separatorStyle
    }

    func didSelectRowAt(indexPath: IndexPath) {
        self.delegate?.PunaList?(self, didSelectRowAt: indexPath)
    }

    func getSelectionStyle() -> UITableViewCell.SelectionStyle {
        switch selectionStyle {
        case .none:
            return .none
        case .blue:
            return .blue
        case .gray:
            return .gray
        case .defaultStyle:
            return .default
        }
    }

    func numberOfRows() -> Int {
        let sections = dataSource?.numberOfSections(self) ?? 0
        var rows = 0
        for index in 1...sections {
            rows = rows + (dataSource?.PunaList(self, numberOfRowsInSection: index) ?? 0)
        }
        return rows
    }
}

extension PunaList {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'listType' instead.")
    @IBInspectable public var ibType: String {
        get {
            return self.listType.toString()
        }
        set(val) {
            self.listType = PunaCellType.checkValidEnum(property: "IB type", key: val)
        }
    }
}
