//
//  PunaSliderViewConfigFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal class PunaSliderViewConfigFactory {

    static func provideInternalConfig(forContinuousSlider slider: PunaContinuousSlider) -> PunaSliderViewConfig {
        let value = slider.value
        let valueText = slider.valueText
        let minValue = slider.sliderMinValue ?? 0
        let maxValue = slider.sliderMaxValue ?? 100
        let leftIcon = slider.leftIcon
        let rightIcon = slider.rightIcon
        let type = slider.type
        let tooltipEnabled = slider.tooltipEnabled
        let state = slider.state

        return PunaSliderViewConfig(value, valueText: valueText, minValue: minValue, maxValue: maxValue, leftIconImageName: leftIcon, rightIconImageName: rightIcon, type: type, isTooltipEnabled: tooltipEnabled, state: state)
    }

    static func provideInternalConfig(forSteppedSlider slider: PunaSteppedSlider) -> PunaSliderViewConfig {
        let value = slider.value
        let valueText = slider.valueText
        let minValue = slider.sliderMinValue ?? 0
        let maxValue = slider.sliderMaxValue ?? 100
        let numberOfSteps = slider.numberOfSteps ?? 0
        let leftIcon = slider.leftIcon
        let rightIcon = slider.rightIcon
        let type = slider.type
        let tooltipEnabled = slider.tooltipEnabled
        let state = slider.state

        return PunaSliderViewConfig(value, valueText: valueText, minValue: minValue, maxValue: maxValue, leftIconImageName: leftIcon, rightIconImageName: rightIcon, type: type, isTooltipEnabled: tooltipEnabled, numberOfSteps: numberOfSteps, state: state)
    }
}
