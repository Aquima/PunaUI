//
//  
//  PunaContinuousSlider.swift
//  PunaUI
//
//  Created by Victor Chang on 25/02/2021.
//
//

import UIKit

@objc public protocol PunaContinuousSliderDelegate {
    @objc func onValueChanged(continuousSlider: PunaContinuousSlider)
}

@objc public class PunaContinuousSlider: UIView {
    internal var contentView: PunaSliderView!

    @objc public weak var delegate: PunaContinuousSliderDelegate?
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

	@objc public init(type: PunaSliderType, minValue: Double, maxValue: Double) {
        super.init(frame: .zero)
        self.type = type
        setup()
    }

    // MARK: - Content View Setup

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        let config = PunaSliderViewConfigFactory.provideInternalConfig(forContinuousSlider: self)
        contentView = PunaSliderAbstractView(withConfig: config, delegate: self)
        self.addSubview(contentView)
        contentView.pinToSuperview()
        self.value = config.value
        self.valueText = config.valueText
        self.sliderMinValue = config.minValue
        self.sliderMaxValue = config.maxValue
        self.tooltipEnabled = config.tooltipEnabled
        self.setupIcons(for: config)
    }

    fileprivate func setupIcons(for config: PunaSliderViewConfig) {
        if config.type == .icons {
            self.leftIcon = config.leftIconImageName
            self.rightIcon = config.rightIconImageName
        } else if type != .icons {
            self.leftIcon = nil
            self.rightIcon = nil
        }
    }

    private func drawContentView(with newView: PunaSliderView) {
        self.contentView = newView
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
        let config = PunaSliderViewConfigFactory.provideInternalConfig(forContinuousSlider: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> PunaSliderView {
        let config = PunaSliderViewConfigFactory.provideInternalConfig(forContinuousSlider: self)
        return PunaSliderViewDefault(withConfig: config, delegate: self)
    }
}

extension PunaContinuousSlider: PunaSliderViewDelegate {
    func onValueChanged(value: Double, sender: UISlider) {
        self.value = value
        valueText = "\(value)"
        delegate?.onValueChanged(continuousSlider: self)
	}
}

// MARK: - IB interface
public extension PunaContinuousSlider {
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
