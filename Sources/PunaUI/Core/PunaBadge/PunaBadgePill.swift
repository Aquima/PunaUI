//
//  PunaBadge.swift
//  PunaUI
//

import UIKit

@objc public class PunaBadgePill: UIView {
    internal var contentView: PunaBadgeView!

    /// Defines the hierarchy of an PunaBadge
    @objc public var hierarchy: PunaBadgeHierarchy = .loud {
        didSet {
            updateContentView()
        }
    }

    /// Defines the colors/icon of the Badge
    @objc public var type: PunaBadgeType = .neutral {
        didSet {
            updateContentView()
        }
    }

    /// Defines the border style (Pill only)
    @objc public var border: PunaBadgeBorder = .standard {
        didSet {
            updateContentView()
        }
    }

    /// Defines the size of the PunaBadge
    @objc public var size: PunaBadgeSize = .large {
        didSet {
            updateContentView()
        }
    }

    /// Defines the current text (Pill only)
    @IBInspectable public var text: String = "" {
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

    @objc public init(hierarchy: PunaBadgeHierarchy, type: PunaBadgeType, border: PunaBadgeBorder, size: PunaBadgeSize, text: String) {
        super.init(frame: .zero)
        self.hierarchy = hierarchy
        self.type = type
        self.border = border
        self.size = size
        self.text = text
        setup()
    }

    private func drawContentView(with newView: PunaBadgeView) {
        self.contentView = newView
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
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

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func updateContentView() {
        let config = PunaBadgeViewConfigFactory.provideInternalConfig(fromPill: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which Badge modifier is selected
    private func provideView() -> PunaBadgeView {
        let config = PunaBadgeViewConfigFactory.provideInternalConfig(fromPill: self)
        return PunaBadgeViewPill(withConfig: config)
    }
}

// MARK: - Interface Builder properties
public extension PunaBadgePill {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'hierarchy' instead.")
    @IBInspectable var ibHierarchy: String {
        set(val) {
            self.hierarchy = PunaBadgeHierarchy.checkValidEnum(property: "IB Hierarchy", key: val)
        }
        get {
            return self.hierarchy.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaBadgeType.checkValidEnum(property: "IB Type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'border' instead.")
    @IBInspectable var ibBorder: String {
        set(val) {
            self.border = PunaBadgeBorder.checkValidEnum(property: "IB Border", key: val)
        }
        get {
            return self.border.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'size' instead.")
    @IBInspectable var ibSize: String {
        set(val) {
            self.size = PunaBadgeSize.checkValidEnum(property: "IB Size", key: val)
        }
        get {
            return self.size.toString()
        }
    }
}
