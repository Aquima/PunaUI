//
//
//  PunaSliderViewConfig.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

internal struct PunaSliderViewConfig {

    var leftIconImageName: String? = ""
    var rightIconImageName: String? = ""
    var value: Double! = 0
    var valueText: String?
    var minValue: Double! = 0
    var maxValue: Double! = 100
    var type: PunaSliderType = .simple
    var tooltipEnabled: Bool = false
    var numberOfSteps: Int?
    var state: PunaSliderState = .idle

    init() { }

    init(_ value: Double = 0, valueText: String? = nil, minValue: Double, maxValue: Double, leftIconImageName: String?, rightIconImageName: String?, type: PunaSliderType, isTooltipEnabled: Bool, state: PunaSliderState) {

        self.value = value
        self.valueText = valueText
        self.minValue = minValue
        self.maxValue = maxValue
        self.leftIconImageName = leftIconImageName
        self.rightIconImageName = rightIconImageName
        self.type = type
        self.tooltipEnabled = isTooltipEnabled
        self.state = state
    }

    init(_ value: Double = 0, valueText: String? = nil, minValue: Double, maxValue: Double, leftIconImageName: String?, rightIconImageName: String?, type: PunaSliderType, isTooltipEnabled: Bool, numberOfSteps: Int?, state: PunaSliderState) {

        self.value = value
        self.valueText = valueText
        self.minValue = minValue
        self.maxValue = maxValue
        self.leftIconImageName = leftIconImageName
        self.rightIconImageName = rightIconImageName
        self.type = type
        self.tooltipEnabled = isTooltipEnabled
        self.state = state
        self.numberOfSteps = numberOfSteps
    }
}
