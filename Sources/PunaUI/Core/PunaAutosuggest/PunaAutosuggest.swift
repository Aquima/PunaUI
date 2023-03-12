//
//  PunaAutosuggest.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import UIKit

public class PunaAutosuggest: UIView {

    // Private/internal Attributes
    var contentView: PunaAutosuggestView!
    private(set) var inputTraits: UITextInputTraits? {
        didSet {
            self.updateContentView()
        }
    }

    // Public
    public weak var delegate: PunaAutosuggestDelegate?
    public weak var datasource: PunaAutosuggestDatasource?

    public var state: PunaTextInputState = .idle {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var label: String? {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var helper: String? {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var placeholder: String? {
        didSet {
            self.updateContentView()
        }
    }

    public var leftContent: PunaTextFieldLeftComponent? {
        didSet {
            self.updateContentView()
        }
    }

    /// sets the right component
    public var rightContent: PunaTextFieldRightComponent? {
        didSet {
            self.updateContentView()
        }
    }

    public var textInputTraits: PunaTextInputTraits = .custom {
        didSet {
            guard textInputTraits != .custom else {
                return
            }
            inputTraits = PunaTextInputTraitsFactory.getTraits(for: textInputTraits)
        }
    }

    public func setCustomInputTraits(_ traits: UITextInputTraits) {
        self.inputTraits = traits
        self.textInputTraits = .custom
    }

    @IBInspectable public var counter: UInt16 = 0 {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var text: String {
        get { return contentView.text }
        set { contentView.text = newValue }
    }

    // Init
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public init(state: PunaTextInputState, label: String?, helper: String?, counter: UInt16, placeholder: String?) {
        super.init(frame: .zero)
        self.label = label
        self.helper = helper
        self.placeholder = placeholder
        self.counter = counter
        self.state = state
        setup()
    }
}

// Public Methods
extension PunaAutosuggest {
    public func reloadData() {
        contentView.reloadData()
    }

    @discardableResult
    public override func resignFirstResponder() -> Bool {
        contentView.resignFirstResponder()
    }

    @discardableResult
    public override func becomeFirstResponder() -> Bool {
        contentView.becomeFirstResponder()
    }

    public override var isFirstResponder: Bool {
        return contentView.isFirstResponder
    }
}

// Private Methods
extension PunaAutosuggest {
    private func drawContentView(with newView: PunaAutosuggestAbstractView) {
        self.contentView = newView
        contentView.delegate = self
        contentView.datasource = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func provideView() -> PunaAutosuggestAbstractView {
        return PunaAutosuggestDefaultView(config: configFromAtributes())
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func updateContentView() {
        contentView.update(with: configFromAtributes())
    }

    private func configFromAtributes() -> PunaAutosuggestViewConfig {
        return PunaAutosuggestViewConfigFactory.provideInternalConfig(autosuggest: self)
    }
}

extension PunaAutosuggest: PunaAutosuggestViewDelegate {
    func didChange() {
        delegate?.PunaAutosuggestDidChange?(self)
    }

    func didBeginEditing() {
        updateContentView()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        delegate?.PunaAutosuggestDidBeginEditing?(self)
    }

    @objc private func keyboardDidShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
            let keyboardSize = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size else { return }

        let superViewBouns = superView().bounds
        let availableFrame = CGRect(x: superViewBouns.minX, y: superViewBouns.minY, width: superViewBouns.width, height: superViewBouns.height - keyboardSize.height)
        contentView.showSuggestions(availableFrame: availableFrame)
    }

    func didEndEditing(text: String) {
        NotificationCenter.default.removeObserver(self)
        delegate?.PunaAutosuggestDidEndEditing?(self)
    }

    func shouldBeginEditing() -> Bool {
        return delegate?.PunaAutosuggestShouldBeginEditing?(self) ?? true
    }

    func shouldEndEditing() -> Bool {
        return delegate?.PunaAutosuggestShouldEndEditing?(self) ?? true
    }

    func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.PunaAutosuggest?(self, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }

    func didChangeSelection(selectedRange range: UITextRange?) {
        if #available(iOS 13, *) {
            delegate?.PunaAutosuggestDidChangeSelection?(self, selectedRange: range)
        }
    }

    func didTapRightAction() {
        delegate?.PunaAutosuggestDidTapRightAction?(self)
    }

    func shouldReturn() -> Bool {
        return delegate?.PunaAutosuggestShouldReturn?(self) ?? true
    }

    func didDeleteBackward(_ andWasEmpty: Bool) {
        delegate?.PunaAutosuggest?(self, didDeleteBackwardAnd: andWasEmpty)
    }

    func suggestionWasTapped(suggestion: String) {
        text = suggestion
        updateContentView()
        contentView.hideSuggestions()
        delegate?.PunaAutosuggestSuggestionWasTapped?(self, suggestion: suggestion)
    }
}

extension PunaAutosuggest: PunaAutosuggestViewDatasource {

    func suggestions() -> [String] {
        return datasource?.PunaAutosuggestSuggestions(self) ?? []
    }

    func superView() -> UIView {
        guard let firstWindow = UIApplication.shared.windows.first,
              let rootViewController = firstWindow.rootViewController else {
            return datasource?.PunaAutosuggestSuperView?(self) ?? UIView()
        }

        return datasource?.PunaAutosuggestSuperView?(self) ?? rootViewController.view
    }
}

// MARK: - IB Enum Adapters
public extension PunaAutosuggest {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'state' instead.")
    @IBInspectable var ibState: String {
        set(val) {
            self.state = PunaTextInputState.checkValidEnum(property: "IB State", key: val)
        }
        get {
            return self.state.toString()
        }
    }
}
