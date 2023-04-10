//
//  PunaFeedbackScreen.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit
//import PureLayout

enum PunaFeedbackScreenModeView {
    case center
    case scroll
    case top
}

@objc public class PunaFeedbackScreenView: UIView, PunaAccessibleView {
    private let data: PunaFeedbackScreenData
    private let actions: PunaFeedbackScreenActions
    var mode: PunaFeedbackScreenModeView?
    public var statusBarColor: UIColor {
        data.type == .congrats ? UIColor.Puna.green500 : PunaStyleSheetManager.styleSheet.accentColor
    }
    private var bottomView: UIView?

    private var contentView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.clear
        return containerView
    }()

    private var feedbackContentView: PunaFeedbackContentView!

    private lazy var backScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var containerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let closeButtonContainer = UIView()

    private let separatorView40 = ViewUtils.buildSeparatorView(toSize: 40)
    private let separatorView16 = ViewUtils.buildSeparatorView(toSize: 16, color: .clear)
    private var insetScroll: CGFloat = 0

    private let innerMargin: CGFloat = 16
    private let topMargin: CGFloat = 24
    private let margin: CGFloat = 20
    var accessibilityManager: PunaAccessibilityManager?

    init(data: PunaFeedbackScreenData, actions: PunaFeedbackScreenActions) {
        self.data = data
        self.actions = actions
        super.init(frame: CGRect.zero)
        self.calculateViews()
        if let mode = self.mode {
            switch mode {
            case .scroll:
                setupViewsScroll()
            case .center:
                setupViewsCenter()
            case .top:
                setupViewsTop()
            }
        }
        self.accessibilityManager = PunaFeedbackScreenAccessibilityManager(view: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapMain(sender _: UITapGestureRecognizer) {
        if let closeCallback = self.actions.closeButtonCallback {
            closeCallback()
        }
    }

    private func calculateViews() {
        var buttonContainerHeight = CGFloat(0)
        if let actionButton = self.actions.actionButton {
            let buttonContainerView = PunaFeedbackScreenButtonContainerView(actionButtonText: actionButton.text, callback: actionButton.callback)
            buttonContainerView.setNeedsLayout()
            buttonContainerView.layoutIfNeeded()
            buttonContainerHeight = buttonContainerView.bounds.height
            self.bottomView = buttonContainerView
        }

        feedbackContentView = PunaFeedbackContentView(data: self.data)
//        feedbackContentView.autoSetDimension(.width, toSize: UIScreen.main.bounds.width)
        feedbackContentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        feedbackContentView.setNeedsLayout()
        feedbackContentView.layoutIfNeeded()

        let viewHeight = buttonContainerHeight + innerMargin + feedbackContentView.bounds.height
        setMode(viewHeight: viewHeight)
        let color = (data.body != nil) ?  PunaStyleSheetManager.styleSheet.bgColorSecondary: UIColor.Puna.white
        self.backgroundColor = color
    }

    private func setMode(viewHeight: CGFloat) {
        let availableSpace = UIScreen.main.bounds.height - ViewControllerUtils.getStatusBarHeight()
        let availableSpaceGreaterThanViewHeight = (availableSpace > viewHeight)
        let bodyExists = !(data.body == nil)

        if availableSpaceGreaterThanViewHeight && !bodyExists {
            self.mode = .center
        } else if !availableSpaceGreaterThanViewHeight && !bodyExists {
            self.mode = .scroll
            insetScroll = topMargin
        } else if availableSpaceGreaterThanViewHeight && bodyExists {
            self.mode = .top
        } else {
            self.mode = .scroll
        }
    }

    private func setupViewsTop() {
        self.addSubview(self.contentView)
//        self.contentView.autoPinEdge(toSuperviewEdge: .top)
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        self.contentView.autoPinEdge(toSuperviewEdge: .leading)
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        self.contentView.autoPinEdge(toSuperviewEdge: .trailing)
        self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.contentView.backgroundColor = UIColor.clear
        let content = PunaFeedbackContentView(data: self.data)
        self.contentView.addSubview(content)

//        content.autoPinEdge(toSuperviewEdge: .top)
        content.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        content.autoPinEdge(toSuperviewEdge: .leading)
        content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        content.autoPinEdge(toSuperviewEdge: .trailing)
        content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        if let bottomView = self.bottomView {
            self.addSubview(bottomView)
//            self.contentView.autoPinEdge(.bottom, to: .top, of: bottomView, withOffset: -innerMargin)
            self.contentView.bottomAnchor.constraint(equalTo: self.topAnchor, constant: -innerMargin).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .bottom)
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .leading)
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .trailing)
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        } else {
//            self.contentView.autoPinEdge(toSuperviewEdge: .bottom)
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        if self.actions.closeButtonCallback != nil {setupClose(addToView: self.contentView, insetTop: 0)}
    }

    private func setupViewsCenter() {

        self.addSubview(self.contentView)
//        self.contentView.autoPinEdge(toSuperviewEdge: .top, withInset: topMargin)
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: topMargin).isActive = true
//        self.contentView.autoPinEdge(toSuperviewEdge: .leading, withInset: margin)
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
//        self.contentView.autoPinEdge(toSuperviewEdge: .trailing, withInset: margin)
        self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: margin).isActive = true
        self.contentView.backgroundColor =  UIColor.clear // UIColor.red
        let content = PunaFeedbackContentView(data: self.data)
        self.contentView.addSubview(content)
//        content.autoSetDimension(.width, toSize: UIScreen.main.bounds.width - margin * 2 - (innerMargin * 2) )
        content.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - margin * 2 - (innerMargin * 2)).isActive = true
//        content.autoCenterInSuperview()
        content.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        content.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        if let bottomView = self.bottomView {
            self.addSubview(bottomView)
//            self.contentView.autoPinEdge(.bottom, to: .top, of: bottomView, withOffset: -innerMargin)
            self.contentView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -innerMargin).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .bottom)
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .leading)
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .trailing)
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            
        } else {
//            self.contentView.autoPinEdge(toSuperviewEdge: .bottom)
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        if self.actions.closeButtonCallback != nil {setupClose(addToView: self.contentView, insetTop: -margin, insetTrailing: -margin )}
    }

    private func setupViewsScroll() {
        self.addSubview(self.backScrollView)
        let content = PunaFeedbackContentView(data: self.data)
        self.containerStackView.addArrangedSubview(content)
        self.containerStackView.backgroundColor = insetScroll == 0 ? UIColor.Puna.graySolid070 : UIColor.Puna.white
        self.backScrollView.backgroundColor = containerStackView.backgroundColor
        self.backScrollView.addSubview(self.containerStackView)
//        self.containerStackView.autoSetDimension(.width, toSize: UIScreen.main.bounds.width)
        self.containerStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
//        self.containerStackView.autoPinEdge(toSuperviewEdge: .top, withInset: insetScroll)
        self.containerStackView.topAnchor.constraint(equalTo: self.topAnchor,constant: insetScroll).isActive = true
//        self.containerStackView.autoPinEdge(.leading, to: .leading, of: self.backScrollView)
        self.containerStackView.leadingAnchor.constraint(equalTo: self.backScrollView.leadingAnchor).isActive = true
//        self.containerStackView.autoPinEdge(.trailing, to: .trailing, of: self.backScrollView)
        self.containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        self.backScrollView.autoPinEdgesToSuperviewEdges()
        self.backScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.backScrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.backScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.backScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
//        self.backScrollView.autoMatch(.width, to: .width, of: self) // this is important for scrolling
        self.backScrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.backScrollView.delegate = self
        if let bottomView = self.bottomView {
            self.containerStackView.addArrangedSubview(separatorView16)
            self.backScrollView.addSubview(bottomView)
//            self.containerStackView.autoPinEdge(.bottom, to: .top, of: bottomView)
            self.containerStackView.bottomAnchor.constraint(equalTo: self.topAnchor).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .leading)
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .trailing)
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//            bottomView.autoPinEdge(toSuperviewEdge: .bottom)
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        } else {
//            self.containerStackView.autoPinEdge(toSuperviewEdge: .bottom)
            self.containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        if self.actions.closeButtonCallback != nil {setupClose(addToView: self.backScrollView, insetTop: 0)}
    }

    private func setupClose(addToView: UIView, insetTop: CGFloat = 0, insetTrailing: CGFloat = 0) {

        closeButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        closeButtonContainer.backgroundColor = UIColor.clear
//        closeButtonContainer.autoSetDimensions(to: CGSize(width: 48, height: 48))
        closeButtonContainer.widthAnchor.constraint(equalToConstant: 48).isActive = true
        closeButtonContainer.heightAnchor.constraint(equalToConstant: 48).isActive = true
        let closeIconimageView = UIImageView()
        closeIconimageView.translatesAutoresizingMaskIntoConstraints = false
        closeIconimageView.backgroundColor = UIColor.clear
        closeIconimageView.contentMode = .center
//        closeIconimageView.autoSetDimensions(to: CGSize(width: 48, height: 48))
        closeIconimageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        closeIconimageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        closeButtonContainer.addSubview(closeIconimageView)
        PunaIconsProvider.loadIcon(name: PunaIcons.close24) { (closeImage) in
            closeIconimageView.image = closeImage
            closeIconimageView.tintColor = (self.data.type == .congrats && self.data.body != nil) ? PunaStyleSheetManager.styleSheet.textColorWhite : PunaStyleSheetManager.styleSheet.textColorSecondary
            closeIconimageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            closeIconimageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//            closeIconimageView.autoCenterInSuperview()
        }
        addToView.addSubview(closeButtonContainer)
//        closeButtonContainer.autoPinEdge(toSuperviewEdge: .top, withInset: insetTop)
        closeButtonContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: insetTop).isActive = true
//        closeButtonContainer.autoPinEdge(toSuperviewEdge: .trailing, withInset: insetTrailing)
        closeButtonContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insetTrailing).isActive = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapMain))
        closeButtonContainer.addGestureRecognizer(tap)
        closeButtonContainer.layer.zPosition = 0
    }

    @objc public func updateThumbnail(icon: UIImage) {
        feedbackContentView.headerView.feedbackThumbnail.thumbnailType = .icon
        feedbackContentView.headerView.feedbackThumbnail.image = icon
    }

    @objc public func updateThumbnail(image: UIImage) {
        feedbackContentView.headerView.feedbackThumbnail.thumbnailType = .imageCircle
        feedbackContentView.headerView.feedbackThumbnail.image = image
    }
}

extension PunaFeedbackScreenView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.bounces = scrollView.contentOffset.y > 10
    }
}
