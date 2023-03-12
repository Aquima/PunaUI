//
//  PunaSnackbar.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

/// It is a short message that can be displayed for a defined time or require user action.
/// It always appears at the bottom of the screen above any content. Snackbars disappear automatically.
@objc public class PunaSnackbar: UIView {

    internal var contentView: PunaSnackbarView!

    /// Text shown in Snackbar
    @objc public var text: String = "" {
        didSet {
            self.updateContentView()
        }
    }

    /// Snackbars disappear automatically after this value in seconds.
    /// By default the duration is `normal` (6 seconds)
    @objc public var duration: PunaSnackbarDuration = .normal {
        didSet {
            self.updateContentView()
        }
    }

    /// Snackbar can be shown for different types of feedback.
    /// To enforce the kind of feedback we use different colors.
    @objc public var type: PunaSnackbarType = .neutral {
        didSet {
            self.updateContentView()
        }
    }

    /// Snackbar can show an action button, use this property to set the title and callback for that action
    @objc public var action: PunaSnackbarAction? = nil {
        didSet {
            self.updateContentView()
        }
    }

    /// Show the `Snackbar` at the top visible view controller
    /// If you are showing the snackbar as a result of an async operation consider use `show(at viewController:)`
    /// to ensure that  the `Snackbar` is shown in the right view controller.
    /// If another `Snackbars` are being shown, this is going to be shown when the last one is dismissed.
    @objc public func show() {
        snackbarManager().show(snackbar: self)
    }

    /// Show the Snackbar in the view controller received
    @objc public func show(at viewController: UIViewController) {
        self.context = viewController
        PunaSnackbarManager.shared.show(snackbar: self)
    }

    /// Margin between superview and the Snackbar when is shown
    internal let snackbarMargin: CGFloat = 8.0

    /// Timer used internally to dismiss the snackbar after `duration`.
    /// If there is an action and the button is tapped, this timer is invalidated and the snackbar dismissed.
    internal weak var timer: Timer?

    /// External left constraint to superview margin
    internal var leftMarginConstraint: NSLayoutConstraint?

    /// External right constraint to superview margin
    internal var rightMarginConstraint: NSLayoutConstraint?

    /// External bottom constraint to superview margin, modified to animate the snackbar appearance
    internal var bottomMarginConstraint: NSLayoutConstraint?

    /// The context for the Snackbar to be shown
    internal weak var context: UIViewController?

    /// Internal snackbar manager getter, improving testability
    internal var snackbarManager: () -> PunaSnackbarManager = { PunaSnackbarManager.shared }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(text: String, duration: PunaSnackbarDuration = .normal, type: PunaSnackbarType = .neutral) {
        super.init(frame: .zero)
        self.text = text
        self.duration = duration
        self.type = type
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0.0, height: 8.0) // y: 8px
        self.layer.shadowRadius = 16 // This is the blur
        self.clipsToBounds = false
        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: PunaSnackbarView) {
        self.contentView = newView
        self.contentView.delegate = self
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
        let config = PunaSnackbarViewConfigFactory.provideInternalConfig(from: self)
        contentView.update(withConfig: config)
    }

    private func provideView() -> PunaSnackbarView {
        let config = PunaSnackbarViewConfigFactory.provideInternalConfig(from: self)
        return PunaSnackbarView(withConfig: config)
    }

    /// Internal method to update the action button position acording to its content
    internal func updateButtonsLayout() {
        self.contentView.updateButtonsLayout()
    }
}

extension PunaSnackbar: PunaSnackbarViewDelegate {
    func actionButtonTapped() {
        // Callback to perform the action
        if let callback = self.action?.callback {
            callback()
        }

        // Dismiss the snackbar animated
        snackbarManager().dismissSnackbarAnimated(snackbar: self)
    }
}
