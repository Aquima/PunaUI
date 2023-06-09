//
//  PunaButtonAbstractView.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit
/**
 PunaButtonAbstractView is an abstract class that includes the functionality for the button to be drawn by a PunaButtonSizeProtocol and a PunaButtonStyleProtocol
 */
internal class PunaButtonAbstractView: UIControl, PunaButtonView {

    internal var config: PunaButtonViewConfig
    internal var backgroundLayer: CALayer

    @IBOutlet var buttonView: UIView!
    @IBOutlet var label: UILabel!

    override public var frame: CGRect {
        didSet {
               buttonView?.frame = frame
           }
    }

    internal enum SpinnerState {
        case enabled
        case disabled

        mutating func changeState() {
            switch self {
            case .enabled:
                self = .disabled
            case .disabled:
                self = .enabled
            }
        }
    }

    private var spinnerState: SpinnerState = .disabled {
        didSet {
            self.updateSpinnerState()
        }
    }

    private let spinnerTransitionDuration: TimeInterval = 0.2
    private let spinnerTransitionPosition: CGFloat = 36

    lazy var spinner: PunaProgressIndicatorIndeterminate = {
        let color = config.spinnerTintColor
        let size = config.spinnerSize
        let spinner = PunaProgressIndicatorIndeterminate(size: size, tint: color)
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinner.topAnchor.constraint(equalTo: topAnchor),
            spinner.trailingAnchor.constraint(equalTo: trailingAnchor),
            spinner.leadingAnchor.constraint(equalTo: leadingAnchor),
            spinner.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        return spinner
    }()

    var contentView: UIView {
        return buttonView.subviews.first ?? label
    }

    internal func startSpinnerAnimation() {
        guard spinnerState != .enabled else { return }
        spinnerState.changeState()
    }

    internal func stopSpinnerAnimation() {
        guard spinnerState != .disabled else { return }
        spinnerState.changeState()
    }

    internal init(config: PunaButtonViewConfig) {
        self.config = config
        self.backgroundLayer = CALayer()
        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        self.config = PunaButtonViewConfigFactory.provide(hierarchy: .loud, size: .large, text: "Label", icon: nil)
        self.backgroundLayer = CALayer()
        super.init(coder: coder)

        setup()
    }

    private func setup() {
        loadNib()

        backgroundLayer = buttonView.layer
        addSubview(buttonView)

        setupSize()
        setupStyle()
        setText(config.text)
    }

    internal func loadNib() {
        fatalError("This should be override by a subclass")
    }

    internal func setupStyle() {
        backgroundLayer.backgroundColor = config.backgroundColor
        label.textColor = config.textColor
    }

    internal func setupSize() {
        backgroundLayer.cornerRadius = config.cornerRadius
    }

    func enable() {
        setupStyle()
    }

    func disable() {
        backgroundLayer.backgroundColor = config.disableColor
        label.textColor = config.textDisableColor
    }

    func touchUp() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundLayer.backgroundColor = self.config.backgroundColor
        }, completion: nil)
    }

    func touchDown() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundLayer.backgroundColor = self.config.pressedColor
        }, completion: nil)
    }

    func setText(_ text: String) {

        let attributes: [NSAttributedString.Key: Any] = [
            .font: config.font,
            .paragraphStyle: PunaButtonHelper.provideParagraphStyle()
        ]
        let attributedString = NSMutableAttributedString.init(string: text, attributes: attributes)
        let strRange = NSRange(location: 0, length: (text as NSString).length)
        attributedString.addAttributes(attributes, range: strRange)
        for attr in config.textAttributes {
            attributedString.addAttribute(attr.key, value: attr.value, range: strRange)
        }
        label.attributedText = attributedString
    }
}

internal class PunaButtonHelper {

    public static func provideParagraphStyle() -> NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byTruncatingTail

        return paragraphStyle
    }
}

// MARK: - Spinner methods
extension PunaButtonAbstractView {

    private func updateSpinnerState() {
        switch spinnerState {
        case .enabled:
           showSpinner()
        case .disabled:
            hideSpinner()
        }
    }

    private func showSpinner() {
        spinner.startAnimation()
        appearSpinnerAnimation()
    }

    private func hideSpinner() {
        dissapearSpinnerAnimation()
    }

    private func appearSpinnerAnimation() {
        self.clipsToBounds = true
        self.spinner.alpha = 0
        contentView.alpha = 1
        self.spinner.transform = CGAffineTransform(translationX: 0, y: self.spinnerTransitionPosition)
        contentView.transform = CGAffineTransform(translationX: 0, y: 0)

        UIView.animate(
            withDuration: spinnerTransitionDuration,
            delay: 0, options: [.curveEaseIn],
            animations: {
                self.contentView.transform = CGAffineTransform(translationX: 0, y: -self.spinnerTransitionPosition)
                self.spinner.transform = CGAffineTransform(translationX: 0, y: 0)
                self.spinner.alpha = 1
                self.contentView.alpha = 0
        })
    }

    private func dissapearSpinnerAnimation(completion: (() -> Void)? = nil) {
        self.clipsToBounds = true
        self.spinner.alpha = 1
        contentView.alpha = 0
        contentView.transform = CGAffineTransform(translationX: 0, y: self.spinnerTransitionPosition)
        self.spinner.transform = CGAffineTransform(translationX: 0, y: 0)

        UIView.animate(
            withDuration: spinnerTransitionDuration,
            delay: 0,
            options: [.curveEaseIn],
            animations: {
                self.spinner.transform = CGAffineTransform(translationX: 0, y: -self.spinnerTransitionPosition)
                self.contentView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.spinner.alpha = 0
                self.contentView.alpha = 1
        }) { (_) in
            completion?()
        }
    }
}
