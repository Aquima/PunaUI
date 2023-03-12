//
//  
//  PunaTooltipViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal class PunaTooltipViewConfigFactory {
    class func provideInternalConfig(tooltip: PunaTooltip) -> PunaTooltipViewConfig {
        let typeIns = PunaTooltipTypeFactory.provide(tooltip.type)

        let primaryActionConfig = createActionConfig(tooltipAction: tooltip.primaryAction, tooltipType: tooltip.type)

        let secondaryActionConfig = createActionConfig(tooltipAction: tooltip.secondaryAction, tooltipType: tooltip.type)

        let config = PunaTooltipViewConfig(
            type: typeIns,
            title: tooltip.title,
            content: tooltip.content,
            isDismissable: tooltip.isDismissable,
            primaryActionConfig: primaryActionConfig,
            secondaryActionConfig: secondaryActionConfig,
            primaryActionOnPressed: tooltip.primaryAction?.onPressed,
            secondaryActionOnPressed: tooltip.secondaryAction?.onPressed,
            sizeStyle: tooltip.sizeStyle
        )

        return config
    }

    private class func createActionConfig(tooltipAction: PunaTooltipAction?, tooltipType: PunaTooltipType) -> PunaButtonViewConfig? {
        guard let tooltipAction = tooltipAction else {
            return nil
        }
        return PunaTooltipActionFactory.provide(action: tooltipAction, tooltipType: tooltipType)
    }
}
