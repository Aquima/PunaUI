//
//  PunaCardViewConfigFactory.swift
//  PunaUI
//
//  Created by Martin Victory on 14/07/2020.
//

import Foundation
import UIKit

internal class PunaCardViewConfigFactory {
    static func provideConfig(for card: PunaCard) -> PunaCardViewConfig {
        let padding = PunaCardPaddingFactory.provide(card.padding)
        let bodyPadding = PunaCardBodyPaddingFactory.provide(card.bodyPadding)
        let type = PunaCardTypeFactory.provide(card.type)
        let style = PunaCardStyleFactory.provide(card.style)
        let hierarchy = PunaCardHierarchyFactory.provide(card.hierarchy, forStyle: style, forType: type)

        return PunaCardViewConfig(backgroundColor: hierarchy.backgroundColor,
                                   pipeColor: hierarchy.pipeColor,
                                   borderColor: hierarchy.borderColor,
                                   padding: padding.paddingSize,
                                   bodyPadding: bodyPadding.bodyPaddingSize,
                                   titlePadding: padding.titlePaddingSize,
                                   titleHeight: padding.titleHeight,
                                   shadow: hierarchy.cardShadow,
                                   hasCardAction: card.onCardActionPressed != nil,
                                   titleText: card.title,
                                   linkText: card.linkText,
                                   cardView: card.cardView)
    }
}
