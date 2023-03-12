//
//  PunaBadgeIcon.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//

import Foundation
import UIKit

@objc public class PunaBadgeIcon: UIView {

    internal var contentView: PunaBadgeView!

    /// Defines the colors/icon of the Badge
    @objc public var iconType: PunaBadgeIconType = .green {
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

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(iconType: PunaBadgeIconType, size: PunaBadgeSize) {
        super.init(frame: .zero)
        self.iconType = iconType
        self.size = size
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: PunaBadgeView) {
        self.contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    private func updateContentView() {
        contentView.isAccessibilityElement = false

        let config = PunaBadgeViewConfigFactory.provideInternalConfig(fromIcon: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which Badge modifier is selected
    private func provideView() -> PunaBadgeView {
        let config = PunaBadgeViewConfigFactory.provideInternalConfig(fromIcon: self)
        return PunaBadgeViewIcon(withConfig: config)
    }
}

// MARK: - Interface Builder properties
public extension PunaBadgeIcon {

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibIconType: String {
        set(val) {
            self.iconType = PunaBadgeIconType.checkValidEnum(property: "IB Type", key: val)
        }
        get {
            return self.iconType.toString()
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
