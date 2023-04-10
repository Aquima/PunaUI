//
//  PunaFeedbackScreenTextView.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit
//import PureLayout

class PunaFeedbackScreenTextView: UIView, PunaFeedbackScreenViewTextBase {
    let feedbackText: PunaFeedbackScreenText
    private let addBottomMargin: Bool
    private let feedbackColor: PunaFeedbackScreenColor
    private let separatorView16 = ViewUtils.buildSeparatorView(toSize: 16, color: .clear)
    let titleLabel = UILabel()
    let overlineLabel = UILabel()
    let highlightedLabel = UILabel()
    let descriptionTextView = UITextView()

    private let innerMargin: CGFloat = 16
    private let margin: CGFloat = 20
    private let cardTextWidth: CGFloat

    var overlineMode: Bool {
        return self.feedbackText.overline != nil
    }

    private var highlightedCase: Bool {
        return self.feedbackText.highlighted != nil && !overlineMode
    }

    init(screenData: PunaFeedbackScreenText, feedbackColor: PunaFeedbackScreenColor, addBottomMargin: Bool) {
        self.addBottomMargin = addBottomMargin
        self.feedbackText = screenData
        self.feedbackColor = feedbackColor
        self.cardTextWidth = UIScreen.main.bounds.width - (margin * 2) - (innerMargin * 2)
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints  = false
        self.buildSubview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildSubview() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
//        stackView.autoSetDimension(.width, toSize: cardTextWidth)
        stackView.widthAnchor.constraint(equalToConstant: cardTextWidth).isActive = true
        if let overlineText = self.feedbackText.overline {
            stackView.addArrangedSubview(setupOverlineLabel(overlineText: overlineText))
            let separatorView8 = ViewUtils.buildSeparatorView(toSize: 8, color: .clear)
            stackView.addArrangedSubview(separatorView8)
        }

        stackView.addArrangedSubview(setupTitleLabel())
        if highlightedCase {
            let separatorView8 = ViewUtils.buildSeparatorView(toSize: 8, color: .clear)
            stackView.addArrangedSubview(separatorView8)
            stackView.addArrangedSubview(self.setupHighlightedLabel())
        }
        if let descriptionText = self.feedbackText.descriptionText, descriptionText != "" && !overlineMode {
            let separatorView8 = ViewUtils.buildSeparatorView(toSize: 8, color: .clear)
            stackView.addArrangedSubview(separatorView8)
            stackView.addArrangedSubview(descriptionTextView(descriptionText: descriptionText))
        }
        if self.addBottomMargin {
            stackView.addArrangedSubview(self.separatorView16)
        }
        self.addSubview(stackView)
//        stackView.autoPinEdge(toSuperviewEdge: .top)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        stackView.autoPinEdge(toSuperviewEdge: .bottom)
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        stackView.autoPinEdge(toSuperviewEdge: .leading)
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        stackView.autoPinEdge(toSuperviewEdge: .trailing)
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

    private func setupTitleLabel() -> UILabel {
        let fontStyleTitle = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: PunaFontSize.titleM), lineSpacing: 5, fontLineHeight: 22)
        setupBaseTitleLabel()
        titleLabel.setPunaStyle(style: fontStyleTitle, lineHeight: 30)
        titleLabel.textAlignment = .center
        titleLabel.preferredMaxLayoutWidth = cardTextWidth
//        titleLabel.autoSetDimension(.height, toSize: titleLabel.sizeToFitHeightCGFloat())
        titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.sizeToFitHeightCGFloat()).isActive = true
        return titleLabel
    }

    private func setupOverlineLabel(overlineText: String) -> UILabel {
        setupBaseOverlineLabel(overlineText: overlineText)
        overlineLabel.textAlignment = .center
        overlineLabel.preferredMaxLayoutWidth = UIScreen.main.bounds.width - margin * 2 - (innerMargin * 2)
        return overlineLabel
    }

    private func setupHighlightedLabel() -> UILabel {
        let fontStyleHighlighted = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: PunaFontSize.bodyM), lineSpacing: 5, fontLineHeight: 22)
        setupBaseHighlightedLabel(fontStyleHighlighted)

        highlightedLabel.textAlignment = .center
        highlightedLabel.preferredMaxLayoutWidth = self.cardTextWidth
        highlightedLabel.textColor = self.feedbackUIColor()
//        highlightedLabel.autoSetDimension(.height, toSize: highlightedLabel.sizeToFitHeightCGFloat())
        highlightedLabel.heightAnchor.constraint(equalToConstant: highlightedLabel.sizeToFitHeightCGFloat()).isActive = true
        return highlightedLabel
    }

    private func descriptionTextView(descriptionText: String) -> UITextView {
        let fontStyleDescription = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary, font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyM), lineSpacing: 5, fontLineHeight: 22)

        setupBaseDescriptiontext(descriptionText: descriptionText, fontStyleDescription: fontStyleDescription)
        descriptionTextView.textAlignment = .center
        let sizeThatFitsTextView = descriptionTextView.sizeThatFits(CGSize(width: cardTextWidth, height: CGFloat(MAXFLOAT)))
//        descriptionTextView.autoSetDimension(.height, toSize: sizeThatFitsTextView.height) 
        descriptionTextView.heightAnchor.constraint(equalToConstant: sizeThatFitsTextView.height).isActive = true
        descriptionTextView.delegate = self
        return descriptionTextView
    }

    private func feedbackUIColor() -> UIColor {
        switch self.feedbackColor {
        case .green:
            return PunaStyleSheetManager.styleSheet.feedbackColorPositive
        case .red:
            return PunaStyleSheetManager.styleSheet.feedbackColorNegative
        case .orange:
            return PunaStyleSheetManager.styleSheet.feedbackColorCaution
        }
    }
}

extension PunaFeedbackScreenTextView: UITextViewDelegate {

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let index = Int(String(describing: URL)) ?? 0
        self.feedbackText.descriptionLinks?.listener(index)
        return false
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        false
    }
}
