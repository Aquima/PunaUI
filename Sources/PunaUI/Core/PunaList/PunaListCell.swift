//
//  PunaListCell.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit

/**
 This class is a custom cell to PunaUI
 - Requires: See the PunaSimpleCell and PunaChevronCell documentation for integration
 - Important: This class cannot be initialize
*/
@objc public class PunaListCell: UITableViewCell, PunaAccessibleView {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var thumbnailImg: PunaThumbnail!
    @IBOutlet weak var thumbnailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumbnailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImgWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var iconImgHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var spaceThumbnailWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingTopThumbnailConstraint: NSLayoutConstraint!
    @IBOutlet weak var paddingBottomThumbnailConstraint: NSLayoutConstraint!

    @IBOutlet weak var thumbStack: UIStackView!

    var title: String = String()
    var subtitle: String = String()
    @objc public internal(set) var type: PunaCellType = .simple
    var accessibilityManager: PunaAccessibilityManager?

    var fontStyle: PunaFontStyle = PunaFontStyle(textColor: .black,
                                                          font: UIFont.boldSystemFont(ofSize: 16),
                                                          lineSpacing: 2)
    var fontSubTitleStyle: PunaFontStyle = PunaFontStyle(textColor: .black,
                                                                     font: UIFont.boldSystemFont(ofSize: 16),
                                                                     lineSpacing: 2)
    var paddingLeftCell: CGFloat = 0
    var paddingRightCell: CGFloat = 0
    var paddingTopCell: CGFloat = 0
    var paddingBottomCell: CGFloat = 0
    var subTitleHeight: CGFloat = 0
    var separatorHeight: CGFloat = 0
    var heightConstraint: CGFloat = 0
    var titleHeight: CGFloat = 0
    var chevron: String?
    var chevronSize: CGFloat? = 0
    var thumbnailLeft: UIImage?
    var thumbnailSize: CGFloat?
    var separatorThumbnailWidth: CGFloat? = 0
    var paddingTopThumbnail: CGFloat? = 0
    var paddingBottomThumbnail: CGFloat? = 0
    var separatorChevronWidth: CGFloat? = 0
    var paddingTopChevron: CGFloat? = 0
    var paddingBottomChevron: CGFloat? = 0
    var numberOfLines: Int = 0
    var thumbnail: PunaThumbnail?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "")
    }

    func setup(customCell: PunaListCell, separatorStyle: PunaSeparatorStyle) {
        self.setupUIComponents(customCell: customCell)
        self.setupSeparatorStyle(separatorStyle: separatorStyle)
        self.setupThumbnail(customCell: customCell)
        accessibilityManager = PunaListAccessibilityManager(view: self)
    }

    func setupUIComponents(customCell: PunaListCell) {
        self.titleLbl.text = customCell.title
        // TODO improve !! cuando se fix fontStyle
        if customCell.fontStyle.fontLineHeight > 0 {
            self.titleLbl.setPunaStyle(style: customCell.fontStyle, lineHeight: customCell.fontStyle.fontLineHeight)
        } else {
            self.titleLbl.setPunaStyle(style: customCell.fontStyle)
        }
        self.titleLbl.heightAnchor.constraint(greaterThanOrEqualToConstant: customCell.titleHeight).isActive = true
        self.subtitleLbl.text = customCell.subtitle
        self.subtitleLbl.setPunaStyle(style: customCell.fontSubTitleStyle)
        self.descriptionHeightConstraint.constant = customCell.subTitleHeight
        self.setupConstratints(customCell: customCell)
        self.titleLbl.adjustsFontSizeToFitWidth = false
        self.titleLbl.lineBreakMode = .byTruncatingTail
        self.titleLbl.numberOfLines = customCell.numberOfLines
        self.subtitleLbl.adjustsFontSizeToFitWidth = false
        self.subtitleLbl.lineBreakMode = .byTruncatingTail
    }

    func setupConstratints(customCell: PunaListCell) {
        self.paddingLeftConstraint.constant = customCell.paddingLeftCell
        self.paddingRightConstraint.constant = customCell.paddingRightCell
        self.paddingTopConstraint.constant = customCell.paddingTopCell
        self.paddingBottomConstraint.constant = customCell.paddingBottomCell
        self.separatorHeightConstraint.constant = customCell.separatorHeight

        if customCell.thumbnail != nil {
            self.iconImgWidthConstraint.constant = 0
            self.iconImgHeightConstraint.constant = 0
            self.thumbnailWidthConstraint.constant = 0
            self.thumbnailHeightConstraint.constant = 0
        }
    }

    func setupThumbnail(customCell: PunaListCell) {
        if let imageSize = customCell.thumbnailSize, imageSize != 0.0 {
            self.thumbnailImg.accessibilityDescription = customCell.thumbnail?.accessibilityDescription
            if customCell.thumbnail?.type == .icon {
                self.iconImgWidthConstraint.constant = imageSize
                self.iconImgHeightConstraint.constant = imageSize
                self.thumbnailWidthConstraint.constant = imageSize
                self.thumbnailHeightConstraint.constant = imageSize
                self.iconImg.image = customCell.thumbnailLeft
                self.thumbnailImg.type = customCell.thumbnail?.type ?? .icon
                self.thumbnailImg.isHidden = true
                self.iconView.isHidden = false
            } else {
                self.thumbnailWidthConstraint.constant = imageSize
                self.thumbnailHeightConstraint.constant = imageSize
                self.iconImgWidthConstraint.constant = imageSize
                self.iconImgHeightConstraint.constant = imageSize
                self.thumbnailImg.image = customCell.thumbnailLeft
                self.thumbnailImg.type = customCell.thumbnail?.type ?? .imageCircle
                self.thumbnailImg.size = PunaThumbnailSize.floatToPunaThumbnailSize(value: customCell.thumbnailSize ?? 0)
                self.thumbnailImg.isHidden = false
                self.iconView.isHidden = true

            }
            self.paddingTopThumbnailConstraint.constant = customCell.paddingTopThumbnail ?? 0
            self.paddingBottomThumbnailConstraint.constant = customCell.paddingBottomThumbnail ?? 0
            self.spaceThumbnailWidthConstraint.constant = customCell.separatorThumbnailWidth ?? 0
        } else {
            if self.thumbStack != nil {
                self.thumbStack.removeFromSuperview()
            }
        }
    }

    func setupSeparatorStyle(separatorStyle: PunaSeparatorStyle) {
        switch separatorStyle {
        case .none:
            separatorView.backgroundColor = .clear
        case .singleLine:
            separatorView.backgroundColor = UIColor.Puna.gray100
        }
    }

    func updateSize(size: PunaListSize) {
        fatalError("This should be overriden by a subclass")
    }
}
