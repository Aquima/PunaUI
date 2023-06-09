//
//  
//  PunaTabs.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaTabs: UIView, PunaAccessibleView {
    var contentView: PunaTabsView!
    var dispatchQueue: PunaDispatchQueueType = DispatchQueue.main {
        didSet {
            updateContentView()
        }
    }

    @objc public var tabs: [PunaTabItem] = [] {
        didSet {
            validateMaxTabs()
            contentView.resetTabsElements()
            updateContentView()
        }
    }

    @objc public private(set) var selectedTabPosition: Int = 0

    @objc public var type: PunaTabsType = .fullWidth {
        didSet {
            validateMaxTabs()
            contentView.resetTabsElements()
            updateContentView()
        }
    }

    @objc public var onTabItemChange: ((Int, PunaTabs) -> Void)?

    var accessibilityManager: PunaAccessibilityManager?

    private let maxFullWidthTabs: Int = 5

    override public func accessibilityActivate() -> Bool {
        return accessibilityManager?.accessibilityActivated() != nil
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(type: PunaTabsType, tabs: [PunaTabItem]) {
        super.init(frame: .zero)
        self.type = type
        self.tabs = tabs
        setup()
    }

    @objc public func selectTab(at position: Int, animated: Bool) throws {
        guard position < tabs.count, position >= .zero else {
            throw PunaTabsError.tabNotFound
        }
        selectedTabPosition = position
        contentView.updateSelectedTab(at: position, animated: animated)
        accessibilityManager?.viewUpdated()
        onTabItemChange?(position, self)
    }

    private func validateMaxTabs() {
        if type == .fullWidth, tabs.count > maxFullWidthTabs {
            fatalError("The max number of tabs for fullWidth type is 5")
        }
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
        contentView.delegate = self
        accessibilityManager = PunaTabsAccessibilityManager(view: self)
    }

    private func drawContentView(with newView: PunaTabsView) {
        self.contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        let config = PunaTabsViewConfigFactory.provideInternalConfig(PunaTabs: self)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }

    private func provideView() -> PunaTabsView {
        let config = PunaTabsViewConfigFactory.provideInternalConfig(PunaTabs: self)
        return PunaTabsViewDefault(withConfig: config)
    }
}

// MARK: - IB interface
public extension PunaTabs {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaTabsType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }
}

extension PunaTabs: PunaTabsDelegate {
    func didSelectTab(at index: Int) {
        selectedTabPosition = index
        accessibilityManager?.viewUpdated()
        onTabItemChange?(index, self)
    }
}
