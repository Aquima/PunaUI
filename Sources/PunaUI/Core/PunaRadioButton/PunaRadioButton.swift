//
//  PunaRadioButton.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaRadioButton: UIView, PunaAccessibleView {
    internal var contentView: PunaRadioButtonView!

    /// Sets the title of the RadioButton
    @IBInspectable public var title: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the number of lines the title of the RadioButton
    public var titleNumberOfLines: Int? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the type of the RadioButton , default idle
    @objc public var type: PunaRadioButtonType = .idle {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the slign of the RadioButton , default left
    @objc public var align: PunaRadioButtonAlign = .left {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the status of the RadioButton , default unselected
    @objc public var status: PunaRadioButtonStatus = .unselected {
        didSet {
            self.updateContentView()
        }
    }

    var accessibilityManager: PunaAccessibilityManager?

    /// Callback invoked when RadioButton  is tapped
    internal var didTapped: ((PunaRadioButton) -> Void)?

    override public func accessibilityActivate() -> Bool {
        return accessibilityManager?.accessibilityActivated() != nil
    }

    /// Set dismiss callback to be invoked when checkbox button is pressed
    @objc public func setRadioButtonTapped(callback: @escaping ((PunaRadioButton) -> Void)) {
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

    @objc public init(type: PunaRadioButtonType, align: PunaRadioButtonAlign, status: PunaRadioButtonStatus, title: String) {
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
        let config = PunaRadioButtonConfig(for: self)
        contentView = PunaRadioButtonDefaultView(withConfig: config, delegate: self)
        self.addSubview(contentView)
        contentView.pinToSuperview()
        accessibilityManager = PunaRadioButtonAccessibilityManager(view: self)
    }

    private func updateContentView() {
        let config = PunaRadioButtonConfig(for: self)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }
}

extension PunaRadioButton: PunaRadioButtonViewDelegate {
    func radioButtonTapped() {
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
            } else if self.status == .unselected {
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
public extension PunaRadioButton {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaRadioButtonType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'status' instead.")
    @IBInspectable var ibStatus: String {
        set(val) {
            self.status = PunaRadioButtonStatus.checkValidEnum(property: "IB status", key: val)
        }
        get {
            return self.status.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'align' instead.")
    @IBInspectable var ibAlign: String {
        set(val) {
            self.align = PunaRadioButtonAlign.checkValidEnum(property: "IB align", key: val)
        }
        get {
            return self.align.toString()
        }
    }
}
