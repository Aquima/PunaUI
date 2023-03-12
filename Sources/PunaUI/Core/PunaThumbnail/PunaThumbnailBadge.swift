//
//  PunaThumbnailWithBadge.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

@objc public class PunaThumbnailBadge: UIView {

	internal var contentView: PunaThumbnailView!

	@objc public var thumbnailType: PunaThumbnailWithBadgeType = .imageCircle {
		didSet {
			self.reDrawContentViewIfNeededThenUpdate()
		}
	}

	@IBInspectable public var image: UIImage! {
		didSet {
			self.updateContentView()
		}
	}

	var badgeType: PunaThumbnailBadgeType = .dot

	var badgeText: String = ""

	var badgeColor: PunaBadgeIconType = .accent

    var size: PunaThumbnailSize = .size32 {
        didSet {
            self.updateContentView()
        }
    }

	@objc public init(thumbnailType: PunaThumbnailWithBadgeType, image: UIImage) {
		self.thumbnailType = thumbnailType
		self.image = image
		super.init(frame: .zero)
		setup()
		updateContentView()
	}

	init(thumbnailType: PunaThumbnailWithBadgeType, image: UIImage, color: PunaBadgeIconType, size: PunaThumbnailSize = .size64) {
		self.thumbnailType = thumbnailType
		self.image = image
		self.badgeColor = color
		self.size = size
		self.badgeType = .hidden
		super.init(frame: .zero)
		setup()
		updateContentView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	public override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
		updateContentView()
	}

	@objc public func setupBadgePill(color: PunaBadgeIconType, text: String, thumbnailSize: PunaThumbnailBadgePillSize) {
		badgeType = .pill
		badgeText = text
		badgeColor = color
		size = thumbnailSize.thumbnailSizeValue
		updateContentView()
	}

	@objc public func setupBadgeDot(color: PunaBadgeIconType, thumbnailSize: PunaThumbnailBadgeDotSize) {
		badgeType = .dot
		badgeColor = color
		size = thumbnailSize.thumbnailSizeValue
		updateContentView()
	}

	@objc public func setupBadgeIconPill(color: PunaBadgeIconType, thumbnailSize: PunaThumbnailBadgePillSize) {
		badgeType = .icon
		badgeColor = color
		size = thumbnailSize.thumbnailSizeValue
		updateContentView()
	}

	private func setup() {
		translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .clear
		let contentView = provideContentView()
		drawContentView(with: contentView)
	}

	private func drawContentView(with contentView: PunaThumbnailView) {
		self.contentView = contentView
		addSubview(contentView)
		leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
		topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
	}

	private func provideContentView() -> PunaThumbnailView {
		let config = PunaThumbnailViewConfigFactory.provide(for: self)

		if thumbnailType == .icon {
			return PunaThumbnailBadgeIconView(config: config)
		}

		return PunaThumbnailBadgeImageView(config: config)
	}

	private func reDrawContentViewIfNeededThenUpdate() {
		let newView = provideContentView()
		if Swift.type(of: newView) !== Swift.type(of: contentView) {
			contentView.removeFromSuperview()
			drawContentView(with: newView)
		} else {
			updateContentView()
		}
	}

	private func updateContentView() {
		let config = PunaThumbnailViewConfigFactory.provide(for: self)
		contentView.update(withConfig: config)
	}

}

// MARK: - IB interface
public extension PunaThumbnailBadge {
	@IBInspectable var ibThumbnailType: String {
		set(val) {
			self.thumbnailType = PunaThumbnailWithBadgeType.checkValidEnum(property: "IB state", key: val)
		}
		get {
			return self.thumbnailType.toString()
		}
	}
}
