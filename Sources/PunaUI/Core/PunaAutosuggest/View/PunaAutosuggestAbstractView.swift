//
//  PunaAutosuggestAbstractView.swift
//  PunaUI
//

import UIKit

class PunaAutosuggestAbstractView: UIView, PunaAutosuggestView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var textField: PunaTextField!
    let list = PunaList()
    let menu = UIView()

    // TODO: There is no easy way to get the height of a cell
    let listCellHeight = 57

    weak var delegate: PunaAutosuggestViewDelegate!
    weak var datasource: PunaAutosuggestViewDatasource!

    private var config: PunaAutosuggestViewConfig

    private var showing = false

    var availableFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100) // Hack to make lazy floating menu

    lazy var floatingMenu: PunaAutosuggestFloatingMenu = {
        PunaAutosuggestFloatingMenu(config: self.config, targetView: self.textField.contentView.textInputView, superView: datasource.superView(), menu: menu, delegate: self, availableFrame: self.availableFrame)
    }()

    var text: String {
        get { return textField.text }
        set { textField.text = newValue }
    }

    init() {
        self.config = PunaAutosuggestViewConfig()
        super.init(frame: .zero)
        setup()
        update(with: config)
    }

    required init?(coder: NSCoder) {
        self.config = PunaAutosuggestViewConfig()
        super.init(coder: coder)
        setup()
        update(with: config)
    }

    init(config: PunaAutosuggestViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
        update(with: config)
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func pinXibViewToSelf() {
        addSubview(view)
        view.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        self.backgroundColor = .clear
        self.clipsToBounds = false
        setupTextfield()
        setupList()
    }

    func setupList() {
        menu.addSubview(list)
        list.pinToSuperview()
        list.delegate = self
        list.dataSource = self
    }

    func setupTextfield() {
        self.textField.delegate = self
        (textField.contentView as? PunaTextFieldAbstractView)?.innerTextField?.autocorrectionType = .no
    }

    func reloadData() {
        if showing {
            list.reloadData()
            floatingMenu.reloadMenu(with: CGFloat(listCellHeight * datasource.suggestions().count))
        }
    }

    func showSuggestions(availableFrame: CGRect) {
        if !showing {
            floatingMenu.availableFrame = availableFrame
            floatingMenu.showMenu(intrinsicSize: CGFloat(listCellHeight * datasource.suggestions().count))
            list.reloadData()
            showing = true
        }
    }

    func hideSuggestions() {
        if showing {
            floatingMenu.hideMenu()
            showing = false
        }
    }

    func update(with config: PunaAutosuggestViewConfig) {
        self.config = config

        textField.state = config.state
        textField.label = config.label
        textField.helper = config.helper
        textField.placeholder = config.placeholder
        textField.counter = config.counter

        textField.leftContent = config.leftContent
        textField.rightContent = config.rightContent
        if let traits = config.inputTraits {
            textField.setCustomInputTraits(traits)
        }
    }

    override func resignFirstResponder() -> Bool {
        if textField.resignFirstResponder() {
            hideSuggestions()
            return true
        }

        return false
    }

    override func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }

    override var isFirstResponder: Bool {
        return textField.isFirstResponder
    }
}

extension PunaAutosuggestAbstractView: PunaTextFieldDelegate {
    public func PunaTextFieldShouldBeginEditing(_ textField: PunaTextField) -> Bool {
        return delegate?.shouldBeginEditing() ?? true
    }

    public func PunaTextFieldShouldEndEditing(_ textField: PunaTextField) -> Bool {
        return delegate?.shouldEndEditing() ?? true
    }

    public func PunaTextFieldDidBeginEditing(_ textField: PunaTextField) {
        delegate?.didBeginEditing()
    }

    public func PunaTextFieldDidEndEditing(_ textField: PunaTextField) {
        delegate?.didEndEditing(text: textField.text)
    }

    public func PunaTextField(_ textField: PunaTextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField(shouldChangeCharactersIn: range, replacementString: string) ?? true
    }

    @available(iOS 13, *)
    public func PunaTextFieldDidChangeSelection(_ textField: PunaTextField, selectedRange range: UITextRange?) {
        delegate?.didChangeSelection(selectedRange: range)
    }

    public func PunaTextFieldDidChange(_ textField: PunaTextField) {
        delegate?.didChange()
    }

    public func PunaTextFieldDidTapRightAction(_ textField: PunaTextField) {
        delegate?.didTapRightAction()
    }

    public func PunaTextFieldShouldReturn(_ textField: PunaTextField) -> Bool {
        return delegate?.shouldReturn() ?? true
    }

    public func PunaTextField(_ textField: PunaTextField, didDeleteBackwardAnd wasEmpty: Bool) {
        delegate?.didDeleteBackward(wasEmpty)
    }
}

extension PunaAutosuggestAbstractView: PunaListDelegate, PunaListDataSource {
    func PunaList(_ listView: PunaList, didSelectRowAt indexPath: IndexPath) {
        delegate.suggestionWasTapped(suggestion: datasource.suggestions()[indexPath.row])
    }

    func PunaList(_ listView: PunaList, cellForRowAt indexPath: IndexPath) -> PunaListCell {
        let suggestion = datasource.suggestions()[indexPath.row]

        return PunaSimpleCell(withTitle: suggestion)
    }

    func PunaList(_ listView: PunaList, numberOfRowsInSection section: Int) -> Int {
        return datasource.suggestions().count
    }

    func numberOfSections(_ listView: PunaList) -> Int {
        return 1
    }
}

extension PunaAutosuggestAbstractView: PunaAutosuggestFloatingMenuDelegate {
    func didSelectBackground() {
        self.textField.resignFirstResponder()
        hideSuggestions()
    }
}
