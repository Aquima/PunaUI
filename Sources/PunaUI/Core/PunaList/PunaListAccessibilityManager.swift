//
//  PunaListAccessibilityManager.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 29/07/21.
//

import Foundation
import UIKit

class PunaListAccessibilityManager: PunaAccessibilityManager {
    private weak var view: PunaListCell!

    required init(view: UIView) {
        guard let cell = view as? PunaListCell else {
            fatalError("ListCell AccessibilityManager should recieve an PunaListCell")
        }
        self.view = cell
        viewUpdated()
    }

    func viewUpdated() {
        view.isAccessibilityElement = true
        view.accessibilityLabel = createAccessibilityLabel(cell: view)
    }

    func accessibilityActivated() {

    }

    private func createAccessibilityLabel(cell: PunaListCell) -> String {
        var accessibilityLabel: String = ""
        accessibilityLabel += "\(thumbnailText) \(titleText) \(subtitleText)"
        return accessibilityLabel
    }

    private func createThumbnailAccessiblityText() -> String? {
        if view.thumbnailImg != nil {
            guard let thumbnailType = view.thumbnailImg?.type,
                  let thumbnailAccessibilityDescription = view.thumbnailImg?.accessibilityDescription else {
                return nil
            }

            let a11yLabel = thumbnailType == .icon ? "icon accessibility".localized() : "image accessibility".localized()
            return " \(thumbnailAccessibilityDescription), \(a11yLabel)"
        }

        return nil
    }
}

extension PunaListAccessibilityManager {
    var titleText: String {
         if let title = view.titleLbl.text {
            return title + ","
         }
         return ""
     }

    var subtitleText: String {
         if let subtitle = view.subtitleLbl.text {
            return subtitle + "."
         }
         return ""
     }

    var thumbnailText: String {
        if let thumbnail = createThumbnailAccessiblityText() {
            return thumbnail + ","
        }
        return ""
    }
}
