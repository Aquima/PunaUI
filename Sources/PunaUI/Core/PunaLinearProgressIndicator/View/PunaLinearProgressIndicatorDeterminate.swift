//
//  PunaLinearProgressDeterminate.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

@IBDesignable
public class PunaLinearProgressIndicatorDeterminate: UIStackView, PunaLinearProgressIndicator, PunaAccessibleView {

    private var heightAnchorConstraint: NSLayoutConstraint?
    var accessibilityManager: PunaAccessibilityManager?

    private(set) var currentStep = DefaultsLinearProgress.stepInitial {
        didSet {
            accessibilityManager?.viewUpdated()
        }
    }

    @objc public var size: PunaLinearProgressIndicatorSize = DefaultsLinearProgress.size {
        didSet {
            setupTrackHeight(config: createConfig())
        }
    }

    @IBInspectable
    public var indicatorTint: UIColor = DefaultsLinearProgress.indicatorTint {
        didSet {
            setupIndicatorTint(config: createConfig())
        }
    }

    @IBInspectable
    public var trackTint: UIColor = DefaultsLinearProgress.trackTint {
        didSet {
            setupTrack(config: createConfig())
        }
    }

    @IBInspectable
    public var isSplit: Bool = DefaultsLinearProgress.isSplit {
        didSet {
            let config = createConfig()
            resetBackground()
            setupMargin(config: config)
            setupTrack(config: config)
            setupIndicatorTint(config: config)
        }
    }

    @IBInspectable
    public var numberOfSteps: Int = DefaultsLinearProgress.numberOfSteps {
        didSet {
            updateView(config: createConfig())
        }
    }

    public override func prepareForInterfaceBuilder() {
        setup(config: createConfig())
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setup(config: createConfig())
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup(config: createConfig())
    }

    @objc public init(
        indicatorTint: UIColor = DefaultsLinearProgress.indicatorTint,
        trackTint: UIColor = DefaultsLinearProgress.trackTint,
        isSplit: Bool = DefaultsLinearProgress.isSplit,
        numberOfSteps: Int = DefaultsLinearProgress.numberOfSteps,
        size: PunaLinearProgressIndicatorSize = .small
    ) {
        self.indicatorTint = indicatorTint
        self.trackTint = trackTint
        self.isSplit = isSplit
        self.numberOfSteps = numberOfSteps
        self.size = size
        super.init(frame: .zero)
    }

    func createConfig() -> PunaLinearProgressIndicatorViewConfig {
        return PunaLinearProgressIndicatorViewConfigFactory.provideInternalConfig(
            indicatorTint: self.indicatorTint,
            trackTint: self.trackTint,
            isSplit: self.isSplit,
            numberOfSteps: self.numberOfSteps,
            size: self.size)
    }

    func setup(config: PunaLinearProgressIndicatorViewConfig) {
        removeAllViews()
        resetCurrentStep()
        resetBackground()
        setupSteps(config: config)
        setupMargin(config: config)
        setupTrack(config: config)
        setupUIStackView(config: config)
        setupAccessibility()
    }

    func updateView(config: PunaLinearProgressIndicatorViewConfig) {
        setup(config: config)
    }

    private func removeAllViews() {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }

    private func resetCurrentStep() {
        self.currentStep = DefaultsLinearProgress.stepInitial
    }

    private func resetBackground() {
        backgroundColor = nil
    }

    private func setupUIStackView(config: PunaLinearProgressIndicatorViewConfig) {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually

        guard heightAnchorConstraint == nil else {
            return
        }

        if let height = config.size?.height {
            self.heightAnchorConstraint = self.heightAnchor.constraint(equalToConstant: height)
            heightAnchorConstraint?.isActive = true
        } else {
            fatalError("error setupUIStackView in PunaLinearProgressIndicatorDeterminate")
        }
    }

    private func setupAccessibility() {
        self.accessibilityManager = PunaLinearProgressIndicatorAccessibilityManager(view: self)
    }

    private func setupSteps(config: PunaLinearProgressIndicatorViewConfig) {
        for stepViewId in DefaultsLinearProgress.stepOne...self.numberOfSteps {
            let view = createSingleStepView(stepViewId: stepViewId)
            self.addArrangedSubview(view)
        }
    }

    private func createSingleStepView(stepViewId: Int) -> UIView {
        let stepView = UIView()
        stepView.backgroundColor = .blue
        stepView.tag = stepViewId
        return stepView
    }

    private func setupMargin (config: PunaLinearProgressIndicatorViewConfig) {
        if config.isSplit == true, let splitSize = config.size?.splitSize {
            self.spacing = splitSize
        } else {
            self.spacing = CGFloat(DefaultsLinearProgress.splitSize)
        }
    }

    private func setupIndicatorTint(config: PunaLinearProgressIndicatorViewConfig) {
        if currentStep > 0 {
            for stepViewId in DefaultsLinearProgress.stepOne...self.currentStep {
                updateIndicatorToIncrease(config: config, stepViewId: stepViewId)
            }
        }
    }

    private func setupTrack(config: PunaLinearProgressIndicatorViewConfig) {
        if config.isSplit == true {
            setupTrackIsSplit(config: config)
        } else {
            setupTrackNoSplit(config: config)
        }
    }

    private func setupTrackIsSplit(config: PunaLinearProgressIndicatorViewConfig) {
        for stepViewId in self.currentStep...self.numberOfSteps {
            guard stepViewId != 0 else {
                continue
            }
            self.viewWithTag(stepViewId)?.setRectangleShape(
                tint: config.trackTint,
                cornerRadius: config.size?.cornerRadius,
                roundedCorners: DefaultsLinearProgress.allRoundedCorner)
        }
    }

    private func setupTrackNoSplit(config: PunaLinearProgressIndicatorViewConfig) {
        self.setRectangleShape(
            tint: config.trackTint,
            cornerRadius: config.size?.cornerRadius,
            roundedCorners: DefaultsLinearProgress.allRoundedCorner)
        resetTrack(config: config)
    }

    private func resetTrack(config: PunaLinearProgressIndicatorViewConfig) {
        for stepViewId in self.currentStep...self.numberOfSteps {
            guard stepViewId != 0 else {
                continue
            }
            self.viewWithTag(stepViewId)?.setRectangleShape(
                tint: nil,
                cornerRadius: CGFloat(DefaultsLinearProgress.cornerRadius),
                roundedCorners: DefaultsLinearProgress.allRoundedCorner)
        }
    }

    private func setupTrackHeight(config: PunaLinearProgressIndicatorViewConfig) {
        if let height = config.size?.height {
            self.heightAnchorConstraint?.constant = height
            self.layoutIfNeeded()
        } else {
            fatalError("error setupTrackHeight in PunaLinearProgressIndicatorDeterminate")
        }
    }

    @objc public func nextStep() {
        if currentStep < numberOfSteps {
            currentStep += 1
            updateIndicatorToIncrease(config: createConfig(), stepViewId: currentStep)
        }
    }

    private func updateIndicatorToIncrease(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        if config.isSplit == true {
            updateIndicatorToIncreaseIsSplit(config: config, stepViewId: stepViewId)
        } else {
            updateIndicatorToIncreaseNoSplit(config: config, stepViewId: stepViewId)
        }
    }

    private func updateIndicatorToIncreaseIsSplit(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        updateAllRadiusStepIndicator(config: config, stepViewId: stepViewId)
    }

    private func updateIndicatorToIncreaseNoSplit(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        switch stepViewId {
        case DefaultsLinearProgress.stepOne:
            updateAllRadiusStepIndicator(config: config, stepViewId: stepViewId)
        case DefaultsLinearProgress.stepTwo : do {
            updateTopBottomLeftRadiusStepIndicator(config: config, stepViewId: previousStepId(stepViewId: stepViewId))
            updateTopBottomRightRadiusStepIndicator(config: config, stepViewId: stepViewId)
        }
        default: do {
            updateStepIndicatorToNoRadius(config: config, stepViewId: previousStepId(stepViewId: stepViewId))
            updateTopBottomRightRadiusStepIndicator(config: config, stepViewId: stepViewId)
        }
        }
    }

    @objc public func previousStep() {
        if currentStep > DefaultsLinearProgress.stepInitial {
            updateIndicatorToDecrease(config: createConfig(), stepViewId: currentStep)
            currentStep -= 1
        }
    }

    private func updateIndicatorToDecrease(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        if config.isSplit == true {
            updateIndicatorToDecreaseIsSplit(config: config, stepViewId: stepViewId)
        } else {
            updateIndicatorToDecreaseNoSplit(config: config, stepViewId: stepViewId)
        }
    }

    private func updateIndicatorToDecreaseIsSplit(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        self.viewWithTag(stepViewId)?.setRectangleShape(
            tint: config.trackTint,
            cornerRadius: config.size?.cornerRadius,
            roundedCorners: DefaultsLinearProgress.allRoundedCorner)
    }

    private func updateIndicatorToDecreaseNoSplit(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        stepIndicatorTurnOff()
        switch stepViewId {
        case DefaultsLinearProgress.stepOne :
            return
        case DefaultsLinearProgress.stepTwo:
            updateAllRadiusStepIndicator(config: config, stepViewId: previousStepId(stepViewId: stepViewId))
        default:
            updateTopBottomRightRadiusStepIndicator(config: config, stepViewId: previousStepId(stepViewId: stepViewId))
        }
    }

    private func stepIndicatorTurnOff() {
        self.viewWithTag(currentStep)?.setRectangleShape(
            tint: nil,
            cornerRadius: CGFloat(DefaultsLinearProgress.cornerRadius),
            roundedCorners: DefaultsLinearProgress.allRoundedCorner)
    }

    private func updateAllRadiusStepIndicator(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        self.viewWithTag(stepViewId)?.setRectangleShape(
            tint: config.indicatorTint,
            cornerRadius: config.size?.cornerRadius,
            roundedCorners: DefaultsLinearProgress.allRoundedCorner)
    }

    private func updateStepIndicatorToNoRadius(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        self.viewWithTag(stepViewId)?.setRectangleShape(
            tint: config.indicatorTint,
            cornerRadius: CGFloat(DefaultsLinearProgress.cornerRadius),
            roundedCorners: DefaultsLinearProgress.allRoundedCorner)
    }

    private func updateTopBottomRightRadiusStepIndicator(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        self.viewWithTag(stepViewId)?.setRectangleShape(
            tint: config.indicatorTint,
            cornerRadius: config.size?.cornerRadius,
            roundedCorners: DefaultsLinearProgress.topBottomRightRoundedCorner)
    }

    private func updateTopBottomLeftRadiusStepIndicator(
        config: PunaLinearProgressIndicatorViewConfig,
        stepViewId: Int
    ) {
        self.viewWithTag(stepViewId)?.setRectangleShape(
            tint: config.indicatorTint,
            cornerRadius: config.size?.cornerRadius,
            roundedCorners: DefaultsLinearProgress.topBottomLeftRoundedCorner)
    }

    private func previousStepId(stepViewId: Int) -> Int { stepViewId - 1 }

    @objc public func jumpToStep(step: Int) {
        if  case DefaultsLinearProgress.stepOne...numberOfSteps = step {
            if   step > currentStep {
                for _ in 1...(step - currentStep) {
                    nextStep()
                }
            } else if  step < currentStep {
                for _ in 1...(currentStep - step) {
                    previousStep()
                }
            }
        } else {
            fatalError("Value between \(DefaultsLinearProgress.stepOne) and \(numberOfSteps)")
        }
    }
}

// MARK: - IB interface
public extension PunaLinearProgressIndicatorDeterminate {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'Size' instead.")
    @IBInspectable var ibSize: String {
        get {
            return self.size.toString()
        }
        set(val) {
            self.size = PunaLinearProgressIndicatorSize.checkValidEnum(property: "IB size", key: val)
        }
    }
}
