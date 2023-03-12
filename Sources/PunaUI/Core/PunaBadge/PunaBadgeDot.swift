//
//  PunaBadgeDot.swift
//  PunaUI
//
//  Created by Samuel Sainz on 5/13/20.
//

import Foundation
import UIKit

@objc public class PunaBadgeDot: UIView {

    internal var contentView: PunaBadgeView!

    /// Defines the colors/icon of the Badge Dot
    @objc public var type: PunaBadgeType = .neutral {
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

    @objc public init(type: PunaBadgeType) {
        super.init(frame: .zero)
        self.type = type
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

    private func updateContentView() {
        let config = PunaBadgeViewConfigFactory.provideInternalConfig(fromDot: self)
        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which Badge modifier is selected
    private func provideView() -> PunaBadgeView {
        let config = PunaBadgeViewConfigFactory.provideInternalConfig(fromDot: self)
        return PunaBadgeViewDot(withConfig: config)
    }
}
