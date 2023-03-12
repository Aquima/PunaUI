//
//  PunaTextFieldCode.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation
import UIKit

@objc public class PunaTextFieldCode: UIView {

    var contentView: PunaTextFieldCodeView!

    /// Text for the label of the PunaTextFieldCode.
    @IBInspectable public var label: String? {
        didSet {
            updateContentView()
        }
    }

    /// Text for the helpLabel of the PunaTextFieldCode.
    @IBInspectable public var helpLabel: String? {
        didSet {
            updateContentView()
        }
    }

    /// The style of an PunaTextFieldCode defines the amount of input boxes and how they are grouped.
    @objc public var style: PunaTextFieldCodeStyle = .THREESOME {
        didSet {
            reDrawContentViewIfNeededThenUpdate()
        }
    }

    /// The state of an PunaTextFieldCode defines its behaviours and colours.
    @objc public var state: PunaTextFieldCodeState = .IDLE {
        didSet {
            updateContentView()
        }
    }

    /// The text of an PunaTextFieldCode defines the whole text entered taken from all input boxes.
    @IBInspectable public var text: String {
        get { return contentView.text }
        set { contentView.setText(newValue) }
    }

    @objc public weak var delegate: PunaTextFieldCodeDelegate?
    var accessibilityManager: PunaAccessibilityManager?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(label: String?, helpLabel: String?, style: PunaTextFieldCodeStyle, state: PunaTextFieldCodeState) {
        self.label = label
        self.helpLabel = helpLabel
        self.style = style
        self.state = state
        super.init(frame: .zero)
        setup()
    }
}

// MARK: Publics
extension PunaTextFieldCode {
    /// Set focus on the component.
    @objc open func setFocus() {
        contentView.setFocus()
    }

    /// Remove focus from the component.
    @objc open func removeFocus() {
        contentView.removeFocus()
    }
}

// MARK: Privates
private extension PunaTextFieldCode {
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        drawContentView(with: provideView())
        accessibilityManager = PunaTextFieldCodeAccessibilityManager(view: self)
    }

    func drawContentView(with newView: PunaTextFieldCodeView) {
        contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    /// Should return a view depending on which PunaTextfieldCode variant is selected.
    func provideView() -> PunaTextFieldCodeView {
        let config = PunaTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
        switch config.style {
        case .THREESOME:
            return PunaTextFieldCodeThreesome(config: config)
        case .FOURSOME:
            return PunaTextFieldCodeFoursome(config: config)
        case .THREE_BY_THREE:
            return PunaTextFieldCodeThreeByThree(config: config)
        }
    }

    func updateContentView() {
        let config = PunaTextFieldCodeViewConfigFactory.provideInternalConfig(from: self)
        contentView?.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered.
    func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            let oldText = contentView.text
            contentView.removeFromSuperview()
            drawContentView(with: newView)
            if !oldText.isEmpty { contentView.setText(oldText) }
        }
        updateContentView()
    }
}

// MARK: PunaTextFieldCodeDelegate
extension PunaTextFieldCode: PunaTextFieldCodeDelegate {
    public func textDidChange(_ text: String) {
        delegate?.textDidChange?(text)
        accessibilityManager?.viewUpdated()
    }

    public func textDidComplete(_ isComplete: Bool) {
        delegate?.textDidComplete?(isComplete)
        if isComplete {
            accessibilityManager?.makeAnnouncement(type: .message(message: "Campo de código completo".localized()))
        }
    }
}

// MARK: - IB Enum Adapters
public extension PunaTextFieldCode {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'state' instead.")
    @IBInspectable var ibState: String {
        get {
            return ""
        }
        set(val) {
            state = PunaTextFieldCodeState.checkValidEnum(property: "IB State", key: val)
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'style' instead.")
    @IBInspectable var ibStyle: String {
        get {
            return ""
        }
        set(val) {
            style = PunaTextFieldCodeStyle.checkValidEnum(property: "IB Style", key: val)
        }
    }
}

// MARK: - Accessibility
extension PunaTextFieldCode: PunaAccessibleView {
    @objc public override func accessibilityActivate() -> Bool {
        accessibilityManager?.accessibilityActivated()
        return true
    }
}
