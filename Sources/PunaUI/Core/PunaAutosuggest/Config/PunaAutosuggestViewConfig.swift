//
//  PunaAutosuggestViewConfig.swift
//  PunaUI
//


import UIKit

/**
The PunaAutosuggestViewConfig contains the differents customizable attributes of the view
*/
internal struct PunaAutosuggestViewConfig {
    var state: PunaTextInputState = .idle
    var label: String?
    var helper: String?
    var counter: UInt16 = 0
    var placeholder: String?
    var leftContent: PunaTextFieldLeftComponent?
    var rightContent: PunaTextFieldRightComponent?
    var inputTraits: UITextInputTraits?

    // Floating Menu config
    var menuPadding: CGFloat = 8
    var menuAnimationDuration: CGFloat = 0.2
    var menuIntrinsicSize: CGFloat = 100
    var menuCornerRadius: CGFloat = 6
    var menuTopPadding: CGFloat = 40
    var menuBottomPadding: CGFloat = 60

    init(state: PunaTextInputState, label: String?, helper: String?, counter: UInt16, placeholder: String?, leftContent: PunaTextFieldLeftComponent?, rightContent: PunaTextFieldRightComponent?, inputTraits: UITextInputTraits?) {
        self.state = state
        self.label = label
        self.helper = helper
        self.counter = counter
        self.placeholder = placeholder
        self.leftContent = leftContent
        self.rightContent = rightContent
        self.inputTraits = inputTraits
    }

    init() {

    }
}
