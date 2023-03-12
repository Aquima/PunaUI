//
//  PunaFeedbackScreeAccessibilityManager.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

class PunaFeedbackScreenAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaFeedbackScreenView!
    required init(view: UIView) {
        guard let feedbackScreen = view as? PunaFeedbackScreenView else {
            fatalError("PunaFeedbackScreeAccessibilityManager should recieve an PunaFeedbackScreenView")
        }
        self.view = feedbackScreen
        viewUpdated()
    }

    func viewUpdated() {
        setupCloseButtonAccessibility()
        setupTextViewAccessibility()
    }

    func accessibilityActivated() {
        // Not needed
    }

    private func setupTextViewAccessibility() {
        guard let textView = textBaseView() else { return }
        textView.descriptionTextView.isEditable = true
        textView.titleLabel.accessibilityTraits = .header
        textView.descriptionTextView.accessibilityTraits = .staticText
        makeAnnouncement(type: .custom(notification: .layoutChanged, argument: textView.overlineMode ? textView.overlineLabel : textView.titleLabel))
    }

    private func setupCloseButtonAccessibility() {
        view.closeButtonContainer.isAccessibilityElement = true
        view.closeButtonContainer.accessibilityLabel = "Cerrar".localized()
        view.closeButtonContainer.accessibilityTraits = .button
    }

    private func textBaseView() -> PunaFeedbackScreenViewTextBase? {
        var baseTextView: PunaFeedbackScreenViewTextBase?
        func getSubview(view: UIView) {
            if let view = view as? PunaFeedbackScreenViewTextBase {
                baseTextView = view
            }
            guard view.subviews.count > 0 else { return }
            view.subviews.forEach { getSubview(view: $0) }
        }
        getSubview(view: self.view)
        return baseTextView
    }
}
