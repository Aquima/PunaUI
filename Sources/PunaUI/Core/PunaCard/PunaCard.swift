//
//  PunaCard.swift
//  PunaUI
//
//  Created by Martin Victory on 13/07/2020.
//

import UIKit

@objc public class PunaCard: UIView {

    internal var contentView: PunaCardView!

    // MARK: - User properties

    /// Sets the internal card view of the PunaCard
    public var cardView: UIView = UIView() {
        didSet { self.updateContentView() }
    }

    /// Sets the title of the PunaCard
    @IBInspectable public var title: String? {
        didSet { self.updateContentView() }
    }

    /// Sets the padding of the PunaCard
    @objc public var padding: PunaCardPadding = .none {
        didSet {
            self.bodyPadding = self.padding.toPunaCardBodyPadding()
            self.updateContentView()
        }
    }

    /// Sets the body padding of the PunaCard
    @objc public var bodyPadding: PunaCardBodyPadding = .none {
        didSet { self.updateContentView() }
    }

    /// Sets the hierarchy of the PunaCard
    @objc public var hierarchy: PunaCardHierarchy = .primary {
        didSet { self.reDrawContentViewIfNeededThenUpdate() }
    }

    /// Sets the style of the PunaCard
    @objc public var style: PunaCardStyle = .elevated {
        didSet { self.updateContentView() }
    }

    /// Sets the type of PunaCard
    @objc public var type: PunaCardType = .none {
        didSet { self.updateContentView() }
    }

    internal var linkText: String?
    @objc public var actionLinkTitle: String? { self.linkText }

    // closure triggered when user presses the link
    private var onLinkActionPressed: ((_ card: PunaCard) -> Void)?

    // closure triggered when user presses the full card
    internal var onCardActionPressed: ((_ card: PunaCard) -> Void)?

    // MARK: - Initialization
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(cardView: UIView, title: String? = nil, padding: PunaCardPadding = .none, hierarchy: PunaCardHierarchy = .primary, style: PunaCardStyle = .elevated, type: PunaCardType = .none) {
        super.init(frame: .zero)
        self.cardView = cardView
        self.title = title
        self.padding = padding
        self.bodyPadding = self.padding.toPunaCardBodyPadding()
        self.hierarchy = hierarchy
        self.style = style
        self.type = type
        setup()
    }

    // MARK: - Content View Setup

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    /// Should return a view depending on which card variant is selected
    private func provideView() -> PunaCardView {
        let config = PunaCardViewConfigFactory.provideConfig(for: self)

        if let linkText = linkText, !linkText.isEmpty && self.onLinkActionPressed != nil && self.hierarchy == .primary {
            return PunaCardWithLinkView(withConfig: config)
        }

        return PunaCardDefaultView(withConfig: config)
    }

    private func drawContentView(with newView: PunaCardView) {
        self.contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    // MARK: - Conent View Update

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
        let config = PunaCardViewConfigFactory.provideConfig(for: self)
        contentView.update(withConfig: config)
    }

    // MARK: - Actions

    /// Link action, when defined a link button will appear
    /// - Parameters:
    ///   - title: Link text
    ///   - handler: handler to trigger on link tap
    @objc public func setLinkAction(_ title: String, handler: @escaping ((_ card: PunaCard) -> Void)) {
        self.linkText = title
        self.onLinkActionPressed = handler
        reDrawContentViewIfNeededThenUpdate()
    }

    /// Remove link action if present
    @objc public func removeLinkAction() {
        self.linkText = nil
        self.onLinkActionPressed = nil
        reDrawContentViewIfNeededThenUpdate()
    }

    /// Card action, transforms the card into a button
    /// - Parameters:
    ///   - handler: handler to trigger on link tap
    @objc public func setCardAction(handler: @escaping ((_ card: PunaCard) -> Void)) {
        self.onCardActionPressed = handler
        self.updateContentView()
    }

    /// Remove card action if present
    @objc public func removeCardAction() {
        self.onCardActionPressed = nil
        self.updateContentView()
    }
}

// MARK: - PunaCardViewDelegate
extension PunaCard: PunaCardViewDelegate {
    internal func onLinkTouchUp() {
        self.onLinkActionPressed?(self)
    }

    internal func onCardTouchUp() {
        self.onCardActionPressed?(self)
    }
}

// MARK: - IB Interface
public extension PunaCard {

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'padding' instead.")
    @IBInspectable var ibPadding: String {
        set(val) {
            self.padding = PunaCardPadding.checkValidEnum(property: "IB padding", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'style' instead.")
    @IBInspectable var ibStyle: String {
        set(val) {
            self.style = PunaCardStyle.checkValidEnum(property: "IB style", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaCardType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'hierarchy' instead.")
    @IBInspectable var ibHierarchy: String {
        set(val) {
            self.hierarchy = PunaCardHierarchy.checkValidEnum(property: "IB hierarchy", key: val)
        }
        get {
            return self.type.toString()
        }
    }
}
