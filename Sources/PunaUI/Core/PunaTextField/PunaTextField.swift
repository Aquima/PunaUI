//
//  PunaTextField.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

@objc public class PunaTextField: UIView, PunaAccessibleView {
    internal var contentView: PunaTextFieldView!

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

    /// sets the left component, only supperted for simple TextField
    @objc public var leftContent: PunaTextFieldLeftComponent? {
        didSet {
            self.updateContentView()
        }
    }

    /// sets the right component, only supperted for simple TextField
    @objc public var rightContent: PunaTextFieldRightComponent? {
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

    @objc public var attributeText: NSAttributedString? {
        didSet {
            contentView.attributeText = attributeText
        }
    }

    @objc public weak var delegate: PunaTextFieldDelegate?

    internal private(set) var inputTraits: UITextInputTraits? {
        didSet {
            self.updateContentView()
        }
    }

    internal private(set) var isEditing: Bool = false

    var accessibilityManager: PunaAccessibilityManager?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(state: PunaTextInputState, label: String?, helper: String?, counter: UInt16, placeholder: String?) {
        super.init(frame: .zero)
        self.label = label
        self.helper = helper
        self.placeholder = placeholder
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
        accessibilityManager = PunaTextFieldAccessibilityManager(view: self)
    }

    private func updateContentView() {
        let config = PunaTextFieldViewConfigFactory.provideInternalConfig(from: self)
        contentView.update(withConfig: config)
        accessibilityManager?.viewUpdated()
    }

    @objc public func setCustomInputTraits(_ traits: UITextInputTraits) {
        self.inputTraits = traits
        self.textInputTraits = .custom
    }

    /// Should return a view depending on which textfield variant is selected
    private func provideView() -> PunaTextFieldAbstractView {
        let config = PunaTextFieldViewConfigFactory.provideInternalConfig(from: self)
        return PunaTextFieldDefaultView(withConfig: config)
    }

}

extension PunaTextField {
    // MARK: - Keyboard Management
    @discardableResult
    @objc public override func resignFirstResponder() -> Bool {
        contentView.resignFirstResponder()
    }

    @discardableResult
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

extension PunaTextField: PunaTextFieldViewDelegate {
    func textField(_ textField: UITextField, didDeleteBackwardAnd wasEmpty: Bool) {
        delegate?.PunaTextField?(self, didDeleteBackwardAnd: wasEmpty)
    }

    func shouldBeginEditing() -> Bool {
        return delegate?.PunaTextFieldShouldBeginEditing?(self) != false
    }

    func shouldEndEditing() -> Bool {
        return delegate?.PunaTextFieldShouldEndEditing?(self) != false
    }

    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.PunaTextField?(self, shouldChangeCharactersIn: range, replacementString: string)  != false
    }

    func didChangeSelection(selectedRange range: UITextRange?) {
        if #available(iOS 13, *) {
            delegate?.PunaTextFieldDidChangeSelection?(self, selectedRange: range)
        }
    }

    func didBeginEditing() {
        isEditing = true
        updateContentView()
        delegate?.PunaTextFieldDidBeginEditing?(self)
    }

    func didEndEditing(text: String) {
        isEditing = false
        updateContentView()
        delegate?.PunaTextFieldDidEndEditing?(self)
    }

    func didChange() {
        accessibilityManager?.viewUpdated()
        delegate?.PunaTextFieldDidChange?(self)
    }

    func didTapRightAction() {
        delegate?.PunaTextFieldDidTapRightAction?(self)
    }

    func shouldReturn() -> Bool {
        delegate?.PunaTextFieldShouldReturn?(self) != false
    }
}

// MARK: - IB Enum Adapters
public extension PunaTextField {
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
