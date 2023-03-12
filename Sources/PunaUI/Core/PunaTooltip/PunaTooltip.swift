//
//  
//  PunaTooltip.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

@objc public class PunaTooltip: UIView {
    internal var contentView: PunaTooltipView!

    let type: PunaTooltipType
    let title: String?
    let content: String
    let isDismissable: Bool

    let primaryAction: PunaTooltipAction?
    let secondaryAction: PunaTooltipAction?

    let sizeStyle: PunaTooltipWidthSize

    /// Block that is executed when the tooltip disappears.
   @objc public var dismissHandler: (() -> Void)?

    /// show the tooltip in the view
    /// - Parameters:
    ///   - view: view to which you want to highlight
    ///   - superView: view to which the tooltip is added
    ///   - position: preferred position for the tooltip
    @objc public func show(in view: UIView, within superView: UIView, position: PunaTooltipPosition = .top) {
        self.contentView.show(in: view, within: superView, position: position)
    }

    /// dismiss the tooltip
    @objc public func dismiss() {
        self.contentView.dismiss()
    }

    /// Constructor for tooltip
    /// - Parameters:
    ///   - type: type of tooltip
    ///   - content: String representing content of tooltip
    ///   - title: String representing title of tooltip
    ///   - isDismissable: Boolean representing if the tooltip has a close button
    ///   - primaryLoudAction: Action with style Loud
    @objc public convenience init(
        type: PunaTooltipType,
        content: String,
        title: String? = nil,
        isDismissable: Bool = true,
        primaryLoudAction: PunaTooltipAction? = nil
    ) {
        primaryLoudAction?.configure(with: .loud)
        self.init(content: content, title: title, isDismissable: isDismissable, type: type, primaryAction: primaryLoudAction)
    }

    /// Constructor for tooltip
    /// - Parameters:
    ///   - type: type of tooltip
    ///   - content: String representing content of tooltip
    ///   - title: String representing title of tooltip
    ///   - isDismissable: Boolean representing if the tooltip has a close button
    ///   - primaryLoudAction: Action with style Loud
    ///   - sizeStyle: size style of tooltip
    @objc public convenience init(
        type: PunaTooltipType,
        content: String,
        title: String? = nil,
        isDismissable: Bool = true,
        primaryLoudAction: PunaTooltipAction? = nil,
        sizeStyle: PunaTooltipWidthSize
    ) {
        primaryLoudAction?.configure(with: .loud)
        self.init(content: content, title: title, isDismissable: isDismissable, type: type, primaryAction: primaryLoudAction, sizeStyle: sizeStyle)
    }

    /// Constructor for tooltip
    /// - Parameters:
    ///   - type: type of tooltip
    ///   - content: String representing content of tooltip
    ///   - title: String representing title of tooltip
    ///   - isDismissable: Boolean representing if the tooltip has a close button
    ///   - linkAction: Action with style link
    @objc public convenience init(
        type: PunaTooltipType,
        content: String,
        title: String? = nil,
        isDismissable: Bool = true,
        linkAction: PunaTooltipAction
    ) {
        linkAction.configure(with: .link)
        self.init(content: content, title: title, isDismissable: isDismissable, type: type, primaryAction: linkAction)
    }

    /// Constructor for tooltip
    /// - Parameters:
    ///   - type: type of tooltip
    ///   - content: String representing content of tooltip
    ///   - title: String representing title of tooltip
    ///   - isDismissable: Boolean representing if the tooltip has a close button
    ///   - primaryLoudAction: Action with style loud
    ///   - secondaryTransparentAction: Action with style transparent
    @objc public convenience init(
        type: PunaTooltipType,
        content: String,
        title: String? = nil,
        isDismissable: Bool = true,
        primaryLoudAction: PunaTooltipAction,
        secondaryTransparentAction: PunaTooltipAction

    ) {
        primaryLoudAction.configure(with: .loud)
        secondaryTransparentAction.configure(with: .transparent)
        self.init(content: content, title: title, isDismissable: isDismissable, type: type, primaryAction: primaryLoudAction, secondaryAction: secondaryTransparentAction)
    }

    /// Constructor for tooltip
    /// - Parameters:
    ///   - type: type of tooltip
    ///   - content: String representing content of tooltip
    ///   - title: String representing title of tooltip
    ///   - isDismissable: Boolean representing if the tooltip has a close button
    ///   - primaryLoudAction: Action with style loud
    ///   - secondaryTransparentAction: Action with style transparent
    ///   - sizeStyle: size style of tooltip
    @objc public convenience init(
        type: PunaTooltipType,
        content: String,
        title: String? = nil,
        isDismissable: Bool = true,
        primaryLoudAction: PunaTooltipAction,
        secondaryTransparentAction: PunaTooltipAction,
        sizeStyle: PunaTooltipWidthSize

    ) {
        primaryLoudAction.configure(with: .loud)
        secondaryTransparentAction.configure(with: .transparent)
        self.init(content: content, title: title, isDismissable: isDismissable, type: type, primaryAction: primaryLoudAction, secondaryAction: secondaryTransparentAction, sizeStyle: sizeStyle)
    }

    /// Constructor for special light tooltip
    /// - Parameters:
    ///   - content: String representing content of tooltip
    ///   - title: String representing title of tooltip
    ///   - isDismissable: Boolean representing if the tooltip has a close button
    ///   - primaryQuietAction: Action with style quiet
    ///   - secondaryQuietAction: Action with style quiet
    @objc public convenience init(
        lightStyle content: String,
        title: String? = nil,
        isDismissable: Bool = true,
        primaryQuietAction: PunaTooltipAction,
        secondaryQuietAction: PunaTooltipAction

    ) {
        primaryQuietAction.configure(with: .quiet)
        secondaryQuietAction.configure(with: .quiet)
        self.init(content: content, title: title, isDismissable: isDismissable, type: .light, primaryAction: primaryQuietAction, secondaryAction: secondaryQuietAction)
    }

    /// Constructor for special light tooltip
    /// - Parameters:
    ///   - content: String representing content of tooltip
    ///   - title: String representing title of tooltip
    ///   - isDismissable: Boolean representing if the tooltip has a close button
    ///   - primaryQuietAction: Action with style quiet
    @objc public convenience init(
        lightStyle content: String,
        title: String? = nil,
        isDismissable: Bool = true,
        primaryQuietAction: PunaTooltipAction
    ) {
        primaryQuietAction.configure(with: .quiet)
        self.init(content: content, title: title, isDismissable: isDismissable, type: .light, primaryAction: primaryQuietAction)
    }

    private init(
        content: String,
        title: String?,
        isDismissable: Bool,
        type: PunaTooltipType,
        primaryAction: PunaTooltipAction? = nil,
        secondaryAction: PunaTooltipAction? = nil,
        sizeStyle: PunaTooltipWidthSize = .dynamic) {

        self.content = content
        self.title = title
        self.isDismissable = isDismissable
        self.type = type
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self.sizeStyle = sizeStyle
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: PunaTooltipView) {
        self.contentView = newView
        self.contentView.delegate = self
        addSubview(contentView)
        contentView.pinToSuperview()
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> PunaTooltipView {
        let config = PunaTooltipViewConfigFactory.provideInternalConfig(tooltip: self)

        let withActions = primaryAction != nil || secondaryAction != nil

        if withActions {
            return PunaTooltipViewActions(withConfig: config)
        }

        return PunaTooltipViewDefault(withConfig: config)
    }
}

extension PunaTooltip: PunaTooltipViewDelegate {
    func onDismissed() {
        dismissHandler?()
    }
}
