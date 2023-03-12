//
//  PunaSnackbarView.swift
//  PunaUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import UIKit

class PunaSnackbarView: UIView, PunaSnackbarViewProtocol {

    weak var delegate: PunaSnackbarViewDelegate?
    var config: PunaSnackbarViewConfig

    @IBOutlet weak var snackbarView: UIView!
    @IBOutlet weak var snackbarTextLabel: UILabel!
    @IBOutlet weak var snackbarActionButton: PunaButton!

    @IBOutlet var buttonOnTrailingConstraints: [NSLayoutConstraint]!
    @IBOutlet var buttonOnBottomLeadingConstraints: [NSLayoutConstraint]!
    @IBOutlet var hideButtonConstraints: [NSLayoutConstraint]!

    override init(frame: CGRect) {
        config = PunaSnackbarViewConfig()
        super.init(frame: frame)
        setup()
    }

    init(withConfig config: PunaSnackbarViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = PunaSnackbarViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaSnackbarView", owner: self, options: nil)
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        initializeView()
        updateView()
    }

    func initializeView() {
        self.layer.cornerRadius = 6.0
        self.snackbarTextLabel.textColor = UIColor.Puna.white
        self.snackbarTextLabel.font = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 14.0)
    }

    func updateButtonsLayout() {
        if self.config.actionConfig != nil {
            let height = self.snackbarTextLabel.text?.height(withConstrainedWidth: self.snackbarTextLabel.frame.size.width, font: self.snackbarTextLabel.font)
            let lineCount = Int((height ?? 0) / self.snackbarTextLabel.font.lineHeight)

            if lineCount > 1 {
                layoutButtonOnSnackbarBottomLeading()
            } else {
                layoutButtonOnSnackbarTrailing()
            }
        } else {
            hideButton()
        }

        self.layoutIfNeeded()
    }

    func layoutButtonOnSnackbarTrailing() {
        self.snackbarActionButton.isHidden = false
        for constraint in self.buttonOnBottomLeadingConstraints {
            constraint.priority = .defaultLow
        }
        for constraint in self.buttonOnTrailingConstraints {
            constraint.priority = .defaultHigh
        }
    }

    func layoutButtonOnSnackbarBottomLeading() {
        self.snackbarActionButton.isHidden = false
        for constraint in self.buttonOnTrailingConstraints {
            constraint.priority = .defaultLow
        }
        for constraint in self.buttonOnBottomLeadingConstraints {
            constraint.priority = .defaultHigh
        }
    }

    func hideButton() {
        self.snackbarActionButton.isHidden = true
        for constraint in self.hideButtonConstraints {
            constraint.priority = UILayoutPriority(999) // required
        }
    }

    func update(withConfig config: PunaSnackbarViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(snackbarView)
        snackbarView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: snackbarView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: snackbarView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: snackbarView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: snackbarView.bottomAnchor).isActive = true
    }

    func updateView() {
        self.backgroundColor = config.backgroundColor

        self.snackbarTextLabel.text = config.text

        if let actionConfig = config.actionConfig {
            self.snackbarActionButton.updateWithCustomConfig(actionConfig)
        }
    }

    @IBAction func snackbarActionTapped(_ sender: Any) {
        guard let delegate = self.delegate else {
            return
        }

        delegate.actionButtonTapped()
    }
}
