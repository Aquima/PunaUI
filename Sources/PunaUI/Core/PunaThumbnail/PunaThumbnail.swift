//
//  PunaThumbnail.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

@objc public class PunaThumbnail: UIView, PunaAccessibleView {

	internal var contentView: PunaThumbnailView!

	@objc public var hierarchy: PunaThumbnailHierarchy = .defaultHierarchy {
		didSet {
			self.updateContentView()
		}
	}

	@objc public var type: PunaThumbnailType = .icon {
		didSet {
			self.reDrawContentViewIfNeededThenUpdate()
		}
	}

	@objc public var size: PunaThumbnailSize = .size24 {
		didSet {
			self.updateContentView()
		}
	}

	@objc public var state: PunaThumbnailState = .enabled {
		didSet {
			self.updateContentView()
		}
	}

	@objc public var accessibilityDescription: String? {
		didSet {
			self.accessibilityManager?.viewUpdated()
		}
	}

	var accessibilityManager: PunaAccessibilityManager?

	@IBInspectable public var image: UIImage! {
		didSet {
			self.updateContentView()
		}
	}

	@IBInspectable public var accentColor: UIColor? {
		didSet {
			self.updateContentView()
		}
	}

	/**
	Constructor for Thumbnail when it is used programmatically where
	
	- Parameters:
	- hierarchy
	- style is the type of thumbnail you want to draw
	- size is the especification for the Thumbnail dimensions
	- state
	- image
	- accentColor
	*/
	@objc public init( hierarchy: PunaThumbnailHierarchy, type: PunaThumbnailType, size: PunaThumbnailSize, state: PunaThumbnailState, image: UIImage, accentColor: UIColor? = .black) {
		self.hierarchy = hierarchy
		self.type = type
		self.size = size
		self.state = state
		self.image = image
		self.accentColor = accentColor

		super.init(frame: .zero)
		setup()
	}

	/**
	Constructor for the thumbnail when it is used by interface builder
	By defect, it will be .icon and .default 
	*/
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	public override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	private func setup() {
		translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .clear
		let contentView = provideContentView()
		drawContentView(with: contentView)
		accessibilityManager = PunaThumbnailAccessibilityManager(view: self)
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

		if type == .icon {
			return PunaThumbnailIconView(config: config)
		}

		return PunaThumbnailImageView(config: config)
	}

	func updateContentView() {
		let config = PunaThumbnailViewConfigFactory.provide(for: self)
		contentView.update(withConfig: config)
	}

	/// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
	private func reDrawContentViewIfNeededThenUpdate() {
		let newView = provideContentView()
		if Swift.type(of: newView) !== Swift.type(of: contentView) {
			contentView.removeFromSuperview()
			drawContentView(with: newView)
		} else {
			updateContentView()
		}
	}

}

// MARK: - IB interface
public extension PunaThumbnail {
	@available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
	@IBInspectable var ibType: String {
		set(val) {
			self.type = PunaThumbnailType.checkValidEnum(property: "IB type", key: val)
		}
		get {
			return self.type.toString()
		}
	}

	@available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'size' instead.")
	@IBInspectable var ibSize: String {
		set(val) {
			self.size = PunaThumbnailSize.checkValidEnum(property: "IB size", key: val)
		}
		get {
			return self.size.toString()
		}
	}

	@available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'hierarchy' instead.")
	@IBInspectable var ibHierarchy: String {
		set(val) {
			self.hierarchy = PunaThumbnailHierarchy.checkValidEnum(property: "IB hierarchy", key: val)
		}
		get {
			return self.size.toString()
		}
	}

	@available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'state' instead.")
	@IBInspectable var ibState: String {
		set(val) {
			self.state = PunaThumbnailState.checkValidEnum(property: "IB state", key: val)
		}
		get {
			return self.state.toString()
		}
	}
}
