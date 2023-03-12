//
//  PunaRadioButtonDefaultView.swift
//  PunaUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation
import UIKit

class PunaRadioButtonDefaultView: UIView, PunaRadioButtonView {

    @IBOutlet weak var radioButtonLabel: UILabel!
    @IBOutlet weak var leftRadioButton: PunaRadioButtonControl!
    @IBOutlet weak var rightRadioButton: PunaRadioButtonControl!
    @IBOutlet var radioButtonView: UIView!
    @IBOutlet weak var stackView: UIStackView!

    weak var delegate: PunaRadioButtonViewDelegate?

    var config: PunaRadioButtonConfig

    init(withConfig config: PunaRadioButtonConfig, delegate: PunaRadioButtonViewDelegate? = nil) {
        self.config = config
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }

    override init(frame: CGRect) {
        self.config = PunaRadioButtonConfig()
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = PunaRadioButtonConfig()
        super.init(coder: coder)
        setup()
    }

    init() {
        self.config = PunaRadioButtonConfig()
        super.init(frame: .zero)
        setup()
    }

    func radioButtonTapped(_ sender: PunaRadioButtonControl) {
        delegate?.radioButtonTapped()
    }

    func update(withConfig config: PunaRadioButtonConfig) {
        self.config = config
        updateView()
    }

    func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaRadioButtonDefaultView", owner: self, options: nil)
    }

    func setup() {
        loadNib()
        self.addSubview(radioButtonView)
        radioButtonView.pinToSuperview()
        radioButtonView.translatesAutoresizingMaskIntoConstraints = false
        leftRadioButton.tapCallback = radioButtonTapped
        rightRadioButton.tapCallback = radioButtonTapped
        self.radioButtonLabel.isAccessibilityElement = false
        updateView()
    }

    func updateView() {
        self.radioButtonLabel.text = config.title
        self.radioButtonLabel.setPunaStyle(style: PunaStyleSheetManager.styleSheet.bodyM(color: config.textColor))
        self.radioButtonLabel.numberOfLines = config.titleNumberOfLines ?? 0
        radioButtonLabel.lineBreakMode = .byTruncatingTail
        setupButtonView()
        updateRadioButtonsStyles()
    }

    func setupButtonView() {
        let isTitleEmpty = radioButtonLabel.text?.isEmpty ?? true
        stackView.alignment = radioButtonLabel.numberOfLines > 1 ? .top : .fill
        radioButtonLabel.isHidden = isTitleEmpty
        radioButtonLabel.textAlignment = config.align == .left ? .left : .right

        if config.align == .left {
            self.rightRadioButton.isHidden = true
            self.leftRadioButton.isHidden = false
            self.leftRadioButton.filled = config.filled
        } else {
            self.rightRadioButton.isHidden = false
            self.leftRadioButton.isHidden = true
            self.rightRadioButton.filled = config.filled
        }
    }

    func updateRadioButtonsStyles() {
        if let tintColor = config.tintColor {
            self.leftRadioButton.color = tintColor
            self.rightRadioButton.color = tintColor
        }
    }
}
