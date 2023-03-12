//
//  PunaTextAreaDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public protocol PunaTextAreaDelegate {
    @objc optional func PunaTextAreaShouldBeginEditing(_ textArea: PunaTextArea) -> Bool
    @objc optional func PunaTextAreaShouldEndEditing(_ textArea: PunaTextArea) -> Bool
    @objc optional func PunaTextAreaDidBeginEditing(_ textArea: PunaTextArea)
    @objc optional func PunaTextAreaDidEndEditing(_ textArea: PunaTextArea)
    @objc optional func PunaTextArea(_ textArea: PunaTextArea, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    @objc optional func PunaTextAreaDidChangeSelection(_ textArea: PunaTextArea, selectedRange range: UITextRange?)
    @objc optional func PunaTextAreaDidChange(_ textArea: PunaTextArea)
}
