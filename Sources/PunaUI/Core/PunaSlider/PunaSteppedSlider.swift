//
//
//  PunaSteppedSlider.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

@objc public protocol PunaSteppedSliderDelegate {
    @objc func onValueChanged(steppedSlider: PunaSteppedSlider)
}

@objc public class PunaSteppedSlider: UIView {

    @objc public weak var delegate: PunaSteppedSliderDelegate?

    internal var contentView: PunaSliderView!

    // MARK: - User properties

    @objc public var value: Double = 0 {
        didSet {
            updateContentView()
        }
    }

    @objc public var valueText: String? {
        didSet {
            updateContentView()
        }
    }

    @objc public var type: PunaSliderType = .simple {
        didSet {
            updateContentView()
        }
    }

    @objc public var handleType: PunaSliderHandleType = .singleType {
        didSet {
            updateContentView()
        }
    }

    @objc public var tooltipEnabled: Bool = false {
        didSet {
            updateContentView()
        }
    }

    @objc public var leftIcon: String? {
        didSet {
            updateContentView()
        }
    }
    @objc public var rightIcon: String? {
        didSet {
            updateContentView()
        }
    }

    // MARK: - Slider's Limit Values
    public var sliderMinValue: Double? {
        didSet {
            updateContentView()
        }
    }
    public var sliderMaxValue: Double? {
        didSet {
            updateContentView()
        }
    }

    // the current state of the slider
    @objc public var state: PunaSliderState = .idle {
        didSet {
            updateContentView()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public var numberOfSteps: Int? = 5 {
        didSet {
            updateContentView()
        }
    }

    @objc public init(numberOfSteps: Int, type: PunaSliderType, minValue: Double, maxValue: Double) {
        super.init(frame: .zero)
        self.numberOfSteps = numberOfSteps
        self.type = type
        setup()
    }

    // MARK: - Content View Setup

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        let config = PunaSliderViewConfigFactory.provideInternalConfig(forSteppedSlider: self)
        contentView = PunaSliderSteppedView(withConfig: config, delegate: self)
        self.addSubview(contentView)
        contentView.pinToSuperview()
        self.value = config.value
        self.valueText = config.valueText
        self.sliderMinValue = config.minValue
        self.sliderMaxValue = config.maxValue
        self.tooltipEnabled = config.tooltipEnabled
        self.numberOfSteps = config.numberOfSteps ?? 0
        self.state = config.state

    }

    private func drawContentView(with newView: PunaSliderView) {
        contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func updateContentView() {
        let config = PunaSliderViewConfigFactory.provideInternalConfig(forSteppedSlider: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> PunaSliderView {
        let config = PunaSliderViewConfigFactory.provideInternalConfig(forSteppedSlider: self)
        return PunaSliderViewDefault(withConfig: config, delegate: self)
    }
}

extension PunaSteppedSlider: PunaSliderViewDelegate {
    func onValueChanged(value: Double, sender: UISlider) {
        self.value = value
        valueText = "\(value)"
        delegate?.onValueChanged(steppedSlider: self)
    }
}

// MARK: - IB interface
public extension PunaSteppedSlider {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaSliderType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }
}
