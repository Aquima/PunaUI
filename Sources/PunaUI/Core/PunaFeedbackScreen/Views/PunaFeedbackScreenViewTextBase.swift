//
//  PunaFeedbackScreenViewTextBase.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 14/09/21.
//

import Foundation
import UIKit

protocol PunaFeedbackScreenViewTextBase: UIView {
    var titleLabel: UILabel { get }
    var feedbackText: PunaFeedbackScreenText { get }
    var overlineLabel: UILabel { get }
    var highlightedLabel: UILabel { get }
    var descriptionTextView: UITextView { get }
    var overlineMode: Bool { get }
}

extension PunaFeedbackScreenViewTextBase {

    func setupBaseOverlineLabel(overlineText: String) {
        let fontStyleOverline = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary, font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyS), lineSpacing: 5, fontLineHeight: 18)
        overlineLabel.translatesAutoresizingMaskIntoConstraints = false
        overlineLabel.text = overlineText
        overlineLabel.setPunaStyle(style: fontStyleOverline, lineHeight: 18)
        overlineLabel.backgroundColor = UIColor.clear
        overlineLabel.numberOfLines = 0
        overlineLabel.textColor = PunaStyleSheetManager.styleSheet.textColorPrimary
    }

    func setupBaseDescriptiontext(descriptionText: String, fontStyleDescription: PunaFontStyle) {
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.isEditable = false
        descriptionTextView.isSelectable = true
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.backgroundColor = UIColor.clear
        descriptionTextView.attributedText = self.getAttributedTextWithLinks(text: descriptionText, bodyLinks: self.feedbackText.descriptionLinks, fontStyle: fontStyleDescription)
    }

    func setupBaseHighlightedLabel(_ fontStyleHighlighted: PunaFontStyle) {
        highlightedLabel.backgroundColor = UIColor.clear
        highlightedLabel.translatesAutoresizingMaskIntoConstraints = false
        highlightedLabel.text = self.feedbackText.highlighted
        highlightedLabel.setPunaStyle(style: fontStyleHighlighted, lineHeight: 20)
        highlightedLabel.numberOfLines = 0
    }

    func setupBaseTitleLabel() {
        titleLabel.backgroundColor =  UIColor.clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = self.feedbackText.title
        titleLabel.numberOfLines = 0
    }

    func getAttributedTextWithLinks(text: String, bodyLinks: PunaBodyLinks?, fontStyle: PunaFontStyle) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        let allRange = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.foregroundColor, value: fontStyle.textColor, range: allRange)
        attributedString.addAttribute(.font, value: fontStyle.font, range: allRange)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = fontStyle.lineSpacing
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: allRange)
        if let bodyLinks = bodyLinks {
            for (index, link) in bodyLinks.links.enumerated() {
                if link.isValidRange(attributedString) {
                    let range = NSRange(location: link.startIndex, length: link.endIndex - link.startIndex)
                    attributedString.addAttribute(.link, value: String(describing: index), range: range)
                }
            }
        }
        return attributedString
    }
}
