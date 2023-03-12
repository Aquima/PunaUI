//
//
//  PunaSliderAbstractView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit
import UIKit

class PunaSliderAbstractView: UIView, PunaSliderView {

    @IBOutlet weak var componentView: UIView!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tooltipBackgroundView: UIView!
    @IBOutlet weak var tooltipLabel: UILabel!

    @IBOutlet weak var tooltipLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tooltipBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var valueLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var valueLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tooltipTrailingConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    weak var delegate: PunaSliderViewDelegate?
    var config: PunaSliderViewConfig

    init(withConfig config: PunaSliderViewConfig, delegate: PunaSliderViewDelegate) {
        self.config = config
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }

    // MARK: - View initialization

    required init?(coder: NSCoder) {
        config = PunaSliderViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaSliderAbstractView", owner: self, options: nil)
    }

    override init(frame: CGRect) {
        self.config = PunaSliderViewConfig()
        super.init(frame: frame)
        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        componentView.layoutIfNeeded()
        let valuePoint = setSliderThumbValueWithLabel(slider: self.sliderView)
        self.valueLabelLeadingConstraint.constant = valuePoint.x
        super.layoutSubviews()
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        let value = sender.value
        let valueLabelPoint = setSliderThumbValueWithLabel(slider: sender)
        valueLabel.text = "\(value)"
        tooltipLabel.text = "\(value)"
        valueLabelLeadingConstraint.constant = valueLabelPoint.x
        delegate?.onValueChanged(value: Double(value), sender: sender)
        setHandleBehaviour()
    }

    @objc fileprivate func setHandleBehaviour() {
        if sliderView.isHighlighted && config.tooltipEnabled == true {
            hideValueLabel()
            showTooltip()
        } else if !sliderView.isHighlighted {
            showValueLabel()
            hideTooltip()
        }
    }

    func update(withConfig config: PunaSliderViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(componentView)
        componentView.translatesAutoresizingMaskIntoConstraints = false
        componentView.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()
        setupIconsIfNeeded()
        setupSliderColor()
        setupTooltipBackgroundView()
        sliderView.addTarget(self, action: #selector(setHandleBehaviour), for: [.allTouchEvents])
    }

    func setupIconsIfNeeded() {
        if config.type == .icons {
        sliderView.minimumValueImage = UIImage(named: config.leftIconImageName ?? "Puna_ui_restar_16", in: PunaBundle.bundle(), compatibleWith: nil)
        sliderView.maximumValueImage = UIImage(named: config.rightIconImageName ?? "Puna_ui_restar_16", in: PunaBundle.bundle(), compatibleWith: nil)
        }
    }

    func setupTooltipBackgroundView() {
        tooltipBackgroundView.alpha = 0
        tooltipBackgroundView.backgroundColor = UIColor.Puna.gray800
        tooltipBackgroundView.layer.cornerRadius = 5
        tooltipBackgroundView.contentMode = .center
    }

    func setupSliderColor() {
        self.sliderView.minimumTrackTintColor = UIColor.Puna.blueML500.withAlphaComponent(0.7)
        self.sliderView.maximumTrackTintColor = UIColor.Puna.gray070
    }

    func updateView() {
        sliderView.value = Float(config.value)
        valueLabel.text = self.config.valueText ?? "\(sliderView.value)"
        tooltipLabel.text = self.config.valueText ?? "\(sliderView.value)"
        sliderView.minimumValue = Float(config.minValue)
        sliderView.maximumValue = Float(config.maxValue)
        setupState()
        setupIconsIfNeeded()
    }

    fileprivate func hideValueLabel() {
        valueLabelTopConstraint.constant = 0
        UIView.animate(withDuration: 0.15) {
            self.valueLabel.alpha = 0
            self.componentView.layoutIfNeeded()
        }
    }

    fileprivate func showValueLabel() {
        valueLabelTopConstraint.constant = 5
        UIView.animate(withDuration: 0.15) {
            self.valueLabel.alpha = 1
            self.componentView.layoutIfNeeded()
        }
    }

    fileprivate func hideTooltip() {
        tooltipBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.15) {
            self.tooltipBackgroundView.alpha = 0
            self.componentView.layoutIfNeeded()
        }
    }

    fileprivate func showTooltip() {
        tooltipBottomConstraint.constant = 6
        UIView.animate(withDuration: 0.15) {
            self.tooltipBackgroundView.alpha = 1
            self.componentView.layoutIfNeeded()
        }
    }

    fileprivate func setupState() {
        if config.state == .idle {
            sliderView.isEnabled = true
            sliderView.minimumTrackTintColor = UIColor.Puna.blueML500.withAlphaComponent(0.7)
            sliderView.maximumTrackTintColor = UIColor.Puna.gray070
        } else if config.state == .disable {
            sliderView.isEnabled = false
            sliderView.minimumTrackTintColor = UIColor.Puna.gray100
            sliderView.maximumTrackTintColor = UIColor.Puna.gray100
            let disabledStateThumb = PunaSliderThumb.setNormalStateThumb(color: UIColor.Puna.white.withAlphaComponent(1.0), borderColor: UIColor.Puna.gray250)
            sliderView.setThumbImage(disabledStateThumb, for: .disabled)
        }
        setThumbImage()
    }

    func setThumbImage() {
        let normalStateThumb = PunaSliderThumb.setNormalStateThumb(color: UIColor.Puna.white, borderColor: UIColor.Puna.blueML500)
        let borderColor = UIColor.Puna.blueML500.withAlphaComponent(0.3)
        let highlightedThumb = PunaSliderThumb.setHighlightedThumb(color: UIColor.Puna.white, borderColor: borderColor)
        let disabledStateThumb = PunaSliderThumb.setNormalStateThumb(color: UIColor.Puna.white.withAlphaComponent(1.0), borderColor: UIColor.Puna.gray250)
        switch config.state {
            case .idle:
                sliderView.setThumbImage(normalStateThumb, for: .normal)
                sliderView.setThumbImage(highlightedThumb, for: .highlighted)
            case .disable:
                sliderView.setThumbImage(disabledStateThumb, for: .disabled)
        }
    }
}

extension PunaSliderAbstractView {
    fileprivate func setSliderThumbValueWithLabel(slider: UISlider) -> CGPoint {
        let slidertTrack: CGRect = slider.trackRect(forBounds: slider.bounds)
        let sliderThumbFrame: CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: slidertTrack, value: slider.value)
        let xValue: CGFloat = (sliderThumbFrame.origin.x + sliderThumbFrame.width/2 - valueLabel.frame.width/2).rounded(.up)
        let point = CGPoint(x: xValue, y: valueLabel.center.y)
        return point
    }
}
