//
//  PunaCardAbstractView.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import UIKit

class PunaCardAbstractView: UIView, PunaCardView {
    weak var delegate: PunaCardViewDelegate?

    // MARK: - Xib Outlets

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var leftPipe: UIView!
    @IBOutlet weak var userViewContainer: UIView!
    @IBOutlet weak var titleContainer: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleLineDivider: UIView!

    @IBOutlet weak var topUserViewContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingUserViewContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingUserViewContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomUserViewContainerConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLblLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLblTrailingConstraint: NSLayoutConstraint!

    // MARK: - View initialization

    internal var config: PunaCardViewConfig
    private weak var userCardView: UIView?
    private var cardTapGestureRecongizer: UIGestureRecognizer?

    init(withConfig config: PunaCardViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = PunaCardViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        setupCardAction()

        self.addSubview(containerView)
        containerView.pinToSuperview()
        containerView.layer.cornerRadius = 6
        containerView.clipsToBounds = true

        userViewContainer.backgroundColor = .clear
        titleLbl.setPunaStyle(style: PunaFontStyle(textColor: UIColor.Puna.graySolid800, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16), lineSpacing: 1))
        titleLineDivider.backgroundColor = UIColor.Puna.gray100

        updateView()
    }

    /// Override this method on each Card View to setup its unique Xib
    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    private func setupCardAction() {
        self.cardTapGestureRecongizer = UITapGestureRecognizer(target: self, action: #selector(onCardTouchUp))
    }

    @objc internal func onCardTouchUp() {
        delegate?.onCardTouchUp()
    }

    // MARK: - View configuration

    /// Override this method on each Card View to setup its unique components
    internal func updateView() {
        containerView.backgroundColor = config.backgroundColor
        leftPipe.backgroundColor = config.pipeColor

        updateUserView()
        updatePadding()
        updateBorder()
        updateShadow()
        updateTitle()
        updateCardAction()
    }

    private func updateUserView() {
        userCardView?.removeFromSuperview()
        userViewContainer.addSubview(config.cardView)
        config.cardView.pinToSuperview()

        userCardView = config.cardView
    }

    private func updatePadding() {
        topUserViewContainerConstraint.constant = CGFloat(config.bodyPadding)
        leadingUserViewContainerConstraint.constant = CGFloat(config.bodyPadding)
        trailingUserViewContainerConstraint.constant = CGFloat(config.bodyPadding)
        bottomUserViewContainerConstraint.constant = CGFloat(config.bodyPadding)
    }

    private func updateBorder() {
        if let borderColor = config.borderColor {
            containerView.layer.borderColor = borderColor.cgColor
            containerView.layer.borderWidth = 1
        } else {
            containerView.layer.borderWidth = 0
        }
    }

    private func updateShadow() {
        if let shadowConfig = config.shadow {
            layer.shadowColor = shadowConfig.shadowColor.cgColor
            layer.shadowOffset = shadowConfig.shadowOffset
            layer.shadowOpacity = shadowConfig.shadowOpacity
            layer.shadowRadius = shadowConfig.shadowRadius
        } else {
            layer.shadowColor = UIColor.clear.cgColor
        }
    }

    private func updateTitle() {
        guard let titleText = config.titleText else {
            titleLbl.isHidden = true
            titleContainerHeightConstraint.constant = 0
            return
        }

        titleLbl.isHidden = false
        titleLbl.text = titleText
        titleContainerHeightConstraint.constant = CGFloat(config.titleHeight)
        titleLblLeadingConstraint.constant = CGFloat(config.titlePadding)
        titleLblTrailingConstraint.constant = CGFloat(config.titlePadding)
    }

    private func updateCardAction() {
        guard let gestureRecognizer = self.cardTapGestureRecongizer else {
            return
        }

        if config.hasCardAction {
            self.addGestureRecognizer(gestureRecognizer)
            self.userViewContainer.isUserInteractionEnabled = false
        } else {
            self.removeGestureRecognizer(gestureRecognizer)
            self.userViewContainer.isUserInteractionEnabled = true
        }
    }

    func update(withConfig config: PunaCardViewConfig) {
        self.config = config
        updateView()
    }
}
