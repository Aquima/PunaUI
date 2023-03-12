//
//  PunaBadgeViewConfigFactory.swift
//  PunaUI
//

import Foundation
import UIKit

internal class PunaBadgeViewConfigFactory {
    static func provideInternalConfig(fromPill pill: PunaBadgePill) -> PunaBadgeViewConfig {
        let typeIns = PunaBadgeTypeFactory.provide(pill.type)
        let hierarchyIns = PunaBadgeHierarchyFactory.provide(pill.hierarchy, forType: typeIns)
        let pillText = pill.text
        let sizeStyle = PunaBadgeSizeFactory.provide(pill.size)
        let roundedCorners = PunaBadgeBorderFactory.provide(pill.border).corners

        let config = PunaBadgeViewConfig(backgroundColor: hierarchyIns.backgroundColor, text: pillText, sizeStyle: sizeStyle, textColor: hierarchyIns.textColor, roundedCorners: roundedCorners)

        return config
    }

    static func provideInternalConfig(fromDot dot: PunaBadgeDot) -> PunaBadgeViewConfig {

        let backgroundColor = PunaBadgeTypeFactory.provide(dot.type).primaryColor
        let dotText = ""
        let sizeStyle = PunaBadgeSizeDot()
        let textColor = UIColor.clear

        let config = PunaBadgeViewConfig(backgroundColor: backgroundColor, text: dotText, sizeStyle: sizeStyle, textColor: textColor)

        return config
    }

    static func provideInternalConfig(fromIcon icon: PunaBadgeIcon) -> PunaBadgeViewConfig {

        let sizeStyle = PunaBadgeSizeFactory.provide(icon.size)

        let backgroundColor = PunaBadgeTypeFactory.provide(icon.iconType.PunaBadgeType()).primaryColor

        let icon = PunaBadgeTypeFactory.provide(icon.iconType.PunaBadgeType()).getIcon?(size: icon.size) ?? ""

        let config = PunaBadgeViewConfig(icon: icon, backgroundColor: backgroundColor, sizeStyle: sizeStyle)

        return config
    }
}
