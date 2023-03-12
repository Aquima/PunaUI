//
//  PunaMessage.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

@objc public class PunaMessage: UIView, PunaAccessibleView {
    internal var contentView: PunaMessageView!
    /// Sets the hierarchy of the PunaMessage
    @objc public var hierarchy: PunaMessageHierarchy = .loud {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the type of the PunaMessage
    @objc public var type: PunaMessageType = .neutral {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the title of the PunaMessage
    @IBInspectable public var title: String? {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the body of the PunaMessage
    @IBInspectable public var body: String = "" {
        didSet {
            self.updateContentView()
        }
    }

    /// Sets the thumbnail of the PunaMessage
    @objc public var thumbnail: UIImage? {
        didSet {
            self.reDrawContentViewIfNeededThenUpdate()
        }
    }

    @objc public var bullets: [PunaBullet] = [] {
        didSet {
            self.updateContentView()
        }
    }

    /// isDismissable shows a dismiss button, when pressed the message set isHidden = true
    @IBInspectable public var isDismissable: Bool = false {
        didSet {
            self.updateContentView()
        }
    }

    /// if set, a primary button will be shown
    @IBInspectable public var primaryActionText: String? {
           didSet {
               self.reDrawContentViewIfNeededThenUpdate()
           }
       }

    /// if set, a secondary button will be shown, requieres primary to be set
    @IBInspectable public var secondaryActionText: String? {
           didSet {
               self.updateContentView()
           }
       }

    @IBInspectable public var linkActionText: String? {
        didSet {
            self.reDrawContentViewIfNeededThenUpdate()
        }
    }

    private var neededThumbnail: Bool {
        return thumbnail != nil
    }

    private var neededActions: Bool {
        // XOR between primaryAction and linkAction
        return (primaryActionText != nil && !primaryActionText!.isEmpty) != (linkActionText != nil && !linkActionText!.isEmpty)
    }

    // triggered when user presses dismiss
    private var dismissHandler: ((_ message: PunaMessage) -> Void)?

    // triggered when user presses primary button
    private var onPrimaryActionPressed: ((_ message: PunaMessage) -> Void)?

    // triggered when user presses secondary
    private var onSecondaryActionPressed: ((_ message: PunaMessage) -> Void)?

    public var bodyLinks: PunaBodyLinks?

    var accessibilityManager: PunaAccessibilityManager?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    // Retrocompatibility: this init avoids multiple errors on previous Puna message usages
    @objc public init(hierarchy: PunaMessageHierarchy, type: PunaMessageType, title: String, body: String) {
        super.init(frame: .zero)
        self.title = title
        self.body = body
        self.hierarchy = hierarchy
        self.type = type
        setup()
    }

    // init with Puna bullets array
    @objc public init (hierarchy: PunaMessageHierarchy, type: PunaMessageType, title: String, body: String, bullets: [PunaBullet]) {
        super.init(frame: .zero)
        self.title = title
        self.body = body
        self.hierarchy = hierarchy
        self.type = type
        self.bullets = bullets
        setup()
    }

    private func drawContentView(with newView: PunaMessageView) {
        self.contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        accessibilityManager?.viewUpdated()
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
        self.accessibilityManager = PunaMessageAccessibilityManager(view: self)
    }

    private func updateContentView() {
        let config = PunaMessageViewConfigFactory.provideConfig(for: self)
        contentView.update(withConfig: config)
    }

    /// handler to trigger when the user dismisses the message
    /// - Parameter handler: dismiss handler
    @objc public func onDismiss(_ callback: ((_ message: PunaMessage) -> Void)?) {
        self.dismissHandler = callback
    }

    /// Primary action, when defined with a title a button will show on the message
    /// - Parameters:
    ///   - title: Button text
    ///   - handler: handler to trigger when button pressed
    @objc public func setPrimaryAction(_ title: String, handler: ((_ message: PunaMessage) -> Void)?) {
        self.primaryActionText = title
        self.onPrimaryActionPressed = handler
        reDrawContentViewIfNeededThenUpdate()
    }

    /// Actions that shows oly if primary action defined.
    /// - Parameters:
    ///   - title: Button text
    ///   - handler: handler to trigger when button pressed
    @objc public func setSecondaryAction(_ title: String, handler: ((_ message: PunaMessage) -> Void)?) {
        self.secondaryActionText = title
        self.onSecondaryActionPressed = handler
        reDrawContentViewIfNeededThenUpdate()
    }

    /// Link action, when defined with a title a button will show on the message
    /// - Parameters:
    ///   - title: Link text
    ///   - handler: handler to trigger when link is pressed
    @objc public func setLinkAction(_ title: String, handler: ((_ message: PunaMessage) -> Void)?) {
        self.linkActionText = title
        self.onPrimaryActionPressed = handler
        reDrawContentViewIfNeededThenUpdate()
    }

    public func setBodyLinks(_ bodyLinks: PunaBodyLinks) {
        self.bodyLinks = bodyLinks
        reDrawContentViewIfNeededThenUpdate()
    }

    /// Should return a view depending on which message variant is selected
    private func provideView() -> PunaMessageView {
        let config = PunaMessageViewConfigFactory.provideConfig(for: self)

        let thumbnailWithAction = neededThumbnail && neededActions

        if thumbnailWithAction {
            return PunaMessageWithThumbnailAndActionsView(withConfig: config)
        }

        if neededThumbnail {
            return PunaMessageWithThumbnailView(withConfig: config)
        }

        if neededActions {
            return PunaMessageWithActionsView(withConfig: config)
        } else {
            return PunaMessageDefaultView(withConfig: config)
        }
    }
}

extension PunaMessage: PunaMessageViewDelegate {
    func dismissTapped() {
        self.isHidden = true
        dismissHandler?(self)
    }

    func primaryBtnTouchUp() {
        onPrimaryActionPressed?(self)
    }

    func secondaryBtnTouchUp() {
        onSecondaryActionPressed?(self)
    }
}

// MARK: - IB interface
public extension PunaMessage {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = PunaMessageType.checkValidEnum(property: "IB type", key: val)
        }
        get {
            return self.type.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'hierarchy' instead.")
    @IBInspectable var ibHierarchy: String {
        set(val) {
            self.hierarchy = PunaMessageHierarchy.checkValidEnum(property: "IB hierarchy", key: val)
        }
        get {
            return self.hierarchy.toString()
        }
    }
}
