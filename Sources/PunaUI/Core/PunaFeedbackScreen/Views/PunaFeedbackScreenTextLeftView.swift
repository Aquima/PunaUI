//
//  PunaFeedbackScreenTextLeftView.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 31/08/2021.
//

import UIKit
import PureLayout

class PunaFeedbackScreenTextLeftView: UIView, PunaFeedbackScreenViewTextBase {
    let feedbackText: PunaFeedbackScreenText
    private let addBottomMargin: Bool
    private let separatorView16 = ViewUtils.buildSeparatorView(toSize: 16, color: .clear)

    let titleLabel = UILabel()
    let overlineLabel = UILabel()
    let descriptionTextView = UITextView()
    let highlightedLabel = UILabel()
    var overlineMode: Bool {
        self.feedbackText.overline != nil
    }
    var highlightedCase: Bool {
        self.feedbackText.highlighted != nil && !overlineMode
    }

    private let innerMargin: CGFloat = 16
    private let margin: CGFloat = 20
    private let thumbnailSize: CGFloat = 56

    public init(screenData: PunaFeedbackScreenText, addBottomMargin: Bool) {
        self.addBottomMargin = addBottomMargin
        self.feedbackText = screenData
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints  = false
        self.buildSubview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var contentView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.clear
        return containerView
    }()

    private func setupDescriptionText(_ descriptionText: String) {
        let fontStyleDescription = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary,
                                                  font: PunaStyleSheetManager.styleSheet.regularSystemFont(size: PunaFontSize.bodyM),
                                                  lineSpacing: 5,
                                                  fontLineHeight: 20)
        setupBaseDescriptiontext(descriptionText: descriptionText, fontStyleDescription: fontStyleDescription)
        descriptionTextView.textAlignment = .left
        descriptionTextView.textContainer.lineFragmentPadding = 0
        descriptionTextView.textContainer.lineBreakMode = .byWordWrapping
        descriptionTextView.sizeToFit()
        descriptionTextView.delegate = self
    }

    private func setupHighLightedLabel(_ fontStyleHighlighted: PunaFontStyle, _ stackViewWidth: CGFloat) {
        setupBaseHighlightedLabel(fontStyleHighlighted)
        highlightedLabel.textAlignment = .left
        highlightedLabel.preferredMaxLayoutWidth = stackViewWidth
        highlightedLabel.textColor = PunaStyleSheetManager.styleSheet.feedbackColorPositive
    }

    private func setupOverlineText(_ overlineText: String) {
        setupBaseOverlineLabel(overlineText: overlineText)
        overlineLabel.textAlignment = .left
        overlineLabel.autoSetDimension(.height, toSize: overlineLabel.sizeToFitHeightCGFloat())
    }

    fileprivate func setupTitleLabel(_ stackViewWidth: CGFloat) {
        let fontStyleTitle = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: PunaFontSize.titleS), lineSpacing: 5, fontLineHeight: 25)
        setupBaseTitleLabel()
        titleLabel.setPunaStyle(style: fontStyleTitle, lineHeight: 25)
        titleLabel.textAlignment = .left
        titleLabel.preferredMaxLayoutWidth = stackViewWidth
    }

    private func buildSubview() {
        let cardWith = UIScreen.main.bounds.width - margin * 2
        let stackViewWidth = cardWith - ((innerMargin * 3) + thumbnailSize)
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.autoSetDimension(.width, toSize: stackViewWidth)
        if let overlineText = self.feedbackText.overline {
            setupOverlineText(overlineText)
            stackView.addArrangedSubview(overlineLabel)
            overlineLabel.preferredMaxLayoutWidth = stackViewWidth
            let separatorView8 = ViewUtils.buildSeparatorView(toSize: 8, color: .clear)
            stackView.addArrangedSubview(separatorView8)
        }
        setupTitleLabel(stackViewWidth)
        stackView.addArrangedSubview(titleLabel)

        if highlightedCase {
            let fontStyleHighlighted = PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.textColorPrimary, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: PunaFontSize.bodyM), lineSpacing: 5, fontLineHeight: 20)
            let separatorView8 = ViewUtils.buildSeparatorView(toSize: 8, color: .clear)
            stackView.addArrangedSubview(separatorView8)
            setupHighLightedLabel(fontStyleHighlighted, stackViewWidth)
            stackView.addArrangedSubview(highlightedLabel)
        }

        if let descriptionText = self.feedbackText.descriptionText, descriptionText != "" && !overlineMode {
            let separatorView8 = ViewUtils.buildSeparatorView(toSize: 8, color: .clear)
            stackView.addArrangedSubview(separatorView8)
            setupDescriptionText(descriptionText)
            stackView.addArrangedSubview(descriptionTextView)
        }

        self.addSubview(stackView)
        stackView.autoPinEdge(toSuperviewEdge: .top)
        stackView.autoPinEdge(toSuperviewEdge: .bottom)
        stackView.autoPinEdge(toSuperviewEdge: .leading)
        stackView.autoPinEdge(toSuperviewEdge: .trailing)
    }
}

extension PunaFeedbackScreenTextLeftView: UITextViewDelegate {

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let index = Int(String(describing: URL)) ?? 0
        self.feedbackText.descriptionLinks?.listener(index)
        return false
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        false
    }
}
