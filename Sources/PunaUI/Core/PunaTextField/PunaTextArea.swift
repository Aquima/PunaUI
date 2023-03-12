//
//  PunaTextArea.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/7/20.
//

import Foundation
import UIKit

@objc public class PunaTextArea: UIView {
    internal var contentView: PunaTextFieldView!

    /// Attribute for textfield
    @objc public var attributeText: NSAttributedString? {
        didSet {
            contentView.attributeText = attributeText
        }
    }

    /// The state of an PunaTextfield defines its behaviours an colours.
    @objc public var state: PunaTextInputState = .idle {
        didSet {
            self.updateContentView()
        }
    }

    /// Text for the label of the textfield
    @IBInspectable public var label: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the helper label text
    @IBInspectable public var helper: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// if 0, its unlimited, anything else its the limit of chars the user can input.
    @IBInspectable public var counter: UInt16 = 0 {
        didSet {
            self.updateContentView()
        }
    }

    /// sets the placeholder label text.
    @IBInspectable public var placeholder: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// sets the placeholder label text.
    @IBInspectable public var maxLines: UInt16 = 0 {
        didSet {
            self.updateContentView()
        }
    }

    /// Use the predefined text input traits, if you need more customization, use setCustomInputTraits
    @objc public var textInputTraits: PunaTextInputTraits = .custom {
        didSet {
            guard textInputTraits != .custom else {
                return
            }
            inputTraits = PunaTextInputTraitsFactory.getTraits(for: textInputTraits)
        }
    }

    /// returns the current text
    @IBInspectable public var text: String {
        get { return contentView.text }
        set { contentView.text = newValue }
    }

    @objc public weak var delegate: PunaTextAreaDelegate?

    internal private(set) var inputTraits: UITextInputTraits? {
        didSet {
            self.updateContentView()
        }
    }

    internal private(set) var isEditing: Bool = false

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(state: PunaTextInputState, label: String?, helper: String?, counter: UInt16, placeholder: String?, maxLines: UInt16 = 0) {
        super.init(frame: .zero)
        self.label = label
        self.helper = helper
        self.placeholder = placeholder
        self.maxLines = maxLines
        self.counter = counter
        self.state = state
        setup()
    }

    private func drawContentView(with newView: PunaTextFieldAbstractView) {
        self.contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func updateContentView() {
        let config = PunaTextFieldViewConfigFactory.provideInternalConfig(from: self)
        contentView.update(withConfig: config)
    }

    @objc public func setCustomInputTraits(_ traits: UITextInputTraits) {
        self.inputTraits = traits
        self.textInputTraits = .custom
    }

    /// Should return a view depending on which textfield variant is selected
    private func provideView() -> PunaTextFieldAbstractView {
        let config = PunaTextFieldViewConfigFactory.provideInternalConfig(from: self)
        return PunaTextAreaView(withConfig: config)
    }
}
extension PunaTextArea {
    // MARK: - Keyboard Management
    @objc public override func resignFirstResponder() -> Bool {
        contentView.resignFirstResponder()
    }

    @objc public override func becomeFirstResponder() -> Bool {
        contentView.becomeFirstResponder()
    }

    @objc public override var isFirstResponder: Bool {
        return contentView.isFirstResponder
    }

    @objc override public var inputView: UIView? {
        get {
            return contentView.customInputView
        }
        set {
            contentView.customInputView = newValue
        }
    }

    @objc override public var inputAccessoryView: UIView? {
        get {
            return contentView.customInputAccessoryView
        }
        set {
            contentView.customInputAccessoryView = newValue
        }
    }
}

extension PunaTextArea: PunaTextFieldViewDelegate {
    func shouldBeginEditing() -> Bool {
        return delegate?.PunaTextAreaShouldBeginEditing?(self) != false
    }

    func shouldEndEditing() -> Bool {
        return delegate?.PunaTextAreaShouldEndEditing?(self) != false
    }

    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.PunaTextArea?(self, shouldChangeCharactersIn: range, replacementString: string)  != false
    }

    func didChangeSelection(selectedRange range: UITextRange?) {
        delegate?.PunaTextAreaDidChangeSelection?(self, selectedRange: range)
    }

    func didBeginEditing() {
        isEditing = true
        updateContentView()
        delegate?.PunaTextAreaDidBeginEditing?(self)
    }

    func didEndEditing(text: String) {
        isEditing = false
        updateContentView()
        delegate?.PunaTextAreaDidEndEditing?(self)
    }

    func didChange() {
        delegate?.PunaTextAreaDidChange?(self)
    }
}

// MARK: - IB Enum Adapters
public extension PunaTextArea {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'state' instead.")
    @IBInspectable var ibState: String {
        set(val) {
            self.state = PunaTextInputState.checkValidEnum(property: "IB State", key: val)
        }
        get {
            return ""
        }
    }
}
