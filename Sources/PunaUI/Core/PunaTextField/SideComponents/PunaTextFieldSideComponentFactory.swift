//
//  PunaTextFieldSideComponentFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit
internal class PunaTextFieldComponentFactory {
    static func generateLeftComponentView(for config: PunaTextFieldViewConfig, in view: PunaTextFieldView? = nil, visibilities: [PunaTextFieldComponentVisibility]) -> UIView? {
        let leftPadding = config.paddings.left
        guard let visibility = config.leftViewComponent?.visibility, visibilities.contains(visibility) else {
            return TextFieldPaddingView(size: leftPadding)
        }

        switch config.leftViewComponent {
        case let component as PunaTextFieldComponentLabel:
            return PunaTextFieldLabelView(text: component.text, style: component.style, forceLeftPadding: leftPadding)
        case let component as PunaTextFieldComponentIcon:
            return PunaTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case _ as PunaTextFieldEmptySideComponent:
            return UIView(frame: .zero)
        default:
              return TextFieldPaddingView(size: leftPadding)
        }
    }

    static func generateRightComponentView(for config: PunaTextFieldViewConfig, in view: PunaTextFieldView? = nil, visibilities: [PunaTextFieldComponentVisibility]) -> UIView? {
        let rightPadding = config.paddings.right
        guard let visibility = config.rightViewComponent?.visibility, visibilities.contains(visibility) else {
            return TextFieldPaddingView(size: rightPadding)
        }

        switch config.rightViewComponent {
        case let component as PunaTextFieldComponentLabel:
            return PunaTextFieldLabelView(text: component.text, style: component.style, forceRightPadding: rightPadding)
        case let component as PunaTextFieldComponentIcon:
            return PunaTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case let component as PunaTextFieldComponentCheck:
            return PunaTextFieldIconView(iconColor: component.tintColor, icon: component.icon)
        case let component as PunaTextFieldComponentClear:
             return PunaTextFieldClearView(iconColor: component.iconColor, iconName: component.clearIcon) { [weak view] in
                view?.clear()
            }
        case let component as PunaTextFieldComponentAction:
            return PunaTextFieldActionView(label: component.label) {[weak view] in
                view?.delegate?.didTapRightAction()
            }
        case let component as PunaTextFieldComponentProgressIndicator:
            return PunaTextFieldProgressIndicatorView(progressIndicatorColor: component.tintColor)
        case _ as PunaTextFieldEmptySideComponent:
            return UIView(frame: .zero)
        default:
            return TextFieldPaddingView(size: rightPadding)
        }
    }
}
