//
//  PunaCaheckbox.swift
//  PunaUI
//
//  Created by Raul Quispe on 6/15/20.
//

import Foundation
import UIKit

@objc public class PunaCheckbox: UIView, PunaAccessibleView {

    internal var contentView: PunaCheckboxView!

    var accessibilityManager: PunaAccessibilityManager?

    /// Sets the title of the PunaCheckbox
    @IBInspectable public var title: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the type of the PunaCaheckbox , default idle
   @objc public var type: PunaCheckboxType = .idle {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the slign of the PunaCaheckbox , default left
    @objc public var align: PunaCheckboxAlign = .left {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the status of the PunaCaheckbox , default unselected
    @objc public var status: PunaCheckboxStatus = .unselected {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the title Number of Lines of the PunaCheckbox , default 1
    @objc public var titleNumberOfLines: Int = 1 {
        didSet {
            self.updateContentView()
        }
    }

    /// Callback invoked when checkbox button is tapped
    internal var didTapped: ((PunaCheckbox) -> Void)?

    override public func accessibilityActivate() -> Bool {
        return accessibilityManager?.accessibilityActivated() != nil
    }

    /// Set dismiss callback to be invoked when checkbox button is pressed
    @objc public func setCheckboxDidTapped(callback: @escaping ((PunaCheckbox) -> Void)) {
        self.didTapped = callback
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(type: PunaCheckboxType, align: PunaCheckboxAlign, status: PunaCheckboxStatus, title: String? = nil) {
        super.init(frame: .zero)
        self.title = title
        self.type = type
        self.align = align
        self.status = status
        setup()
    }

    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        let config = PunaCheckboxViewConfig(for: self)
        contentView = PunaCheckboxDefaultView(withConfig: config, delegate: self)
        self.addSubview(contentView)
        contentView.pinToSuperview()
        accessibilityManager = PunaCheckboxAccessibilityManager(view: self)
    }

    private func updateContentView() {
        let config = PunaCheckboxViewConfig(for: self)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }
}

extension PunaCheckbox: PunaCheckboxViewDelegate {
    func checkboxTapped() {
        guard let callback = self.didTapped else {
            return
        }
        switch self.type {
        case .error:
            self.type = .idle
            self.status = .selected
        case .idle:
            if self.status == .selected {
                self.status = .unselected
            } else if self.status == .unselected || self.status == .undefined {
                self.status = .selected
            }
        case .disabled:
            // Never happen
            return
        }
        updateContentView()
        callback(self)
    }
}

// MARK: - IB interface
public extension PunaCheckbox {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaCheckboxType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'status' instead.")
    @IBInspectable var ibStatus: String {
        set(val) {
            self.status = PunaCheckboxStatus.checkValidEnum(property: "IB status", key: val)
        }
        get {
            return self.status.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'align' instead.")
    @IBInspectable var ibAlign: String {
        set(val) {
            self.align = PunaCheckboxAlign.checkValidEnum(property: "IB align", key: val)
        }
        get {
            return self.align.toString()
        }
    }
}
