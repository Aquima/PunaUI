//
//  PunaCardWidthLinkView.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import UIKit

class PunaCardWithLinkView: PunaCardAbstractView {

    // MARK: - Xib Outlets
    @IBOutlet weak var linkContainer: UIView!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var linkLineDivider: UIView!

    @IBOutlet weak var linkContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var linkLblLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconViewTrailingConstraint: NSLayoutConstraint!

    // MARK: - Initialization
    override func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaCardWithLinkView", owner: self, options: nil)
    }

    override func setup() {
        super.setup()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        linkContainer.addGestureRecognizer(tapGesture)

        linkLbl.setPunaStyle(style: PunaFontStyle(textColor: PunaStyleSheetManager.styleSheet.accentColor500, font: PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16), lineSpacing: 1))

        PunaIconsProvider.loadIcon(name: PunaIcons.chevronRight20, placeItInto: iconView)
        iconView.tintColor = PunaStyleSheetManager.styleSheet.accentColor500

        linkLineDivider.backgroundColor = UIColor.Puna.gray100
    }

    // MARK: - Update View
    override func updateView() {
        super.updateView()
        updateLink()
    }

    private func updateLink() {
        linkLbl.text = config.linkText
        linkContainerHeightConstraint.constant = CGFloat(config.titleHeight)
        linkLblLeadingConstraint.constant = CGFloat(config.titlePadding)
        iconViewTrailingConstraint.constant = CGFloat(config.titlePadding)
    }

    // MARK: - User Interaction
    @objc internal func handleTap() {
        self.delegate?.onLinkTouchUp()
    }
}
