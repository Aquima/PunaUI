//
//  PunaFeedbackScreenHeaderView.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit
//import PureLayout

class PunaFeedbackScreenHeaderView: UIView {
    private let dataHeader: PunaFeedbackScreenHeader
    private let separator: Bool
    private var gradientView: UIView?
    private let showGradient: Bool
    private let feedbackColor: PunaFeedbackScreenColor
    private let innerMargin: CGFloat = 16
    private let margin: CGFloat = 20
    private let thumbnailHeightSize: CGFloat = 56
    var feedbackThumbnail: PunaThumbnailBadge!

    private var containerTextView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.clear
        return containerView
    }()

    private var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.clear
        return containerView
    }()

    init(dataHeader: PunaFeedbackScreenHeader, separator: Bool, showGradient: Bool, feedbackColor: PunaFeedbackScreenColor) {
        self.dataHeader = dataHeader
        self.separator = separator
        self.showGradient = showGradient
        self.feedbackColor = feedbackColor
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupViews()
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.gradientView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: UIScreen.main.bounds.width, height: 144)))
		setupViewWithThumbnail()
    }

    private func createGradientView() {
        self.gradientView?.frame = CGRect(origin: CGPoint.init(x: 0, y: -56), size: CGSize(width: UIScreen.main.bounds.width, height: 144))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gradientView?.bounds ?? CGRect.zero
        gradientLayer.colors = [UIColor.Puna.green500.cgColor, UIColor.Puna.green500.withAlphaComponent(0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.locations = [0.38, 1.0]
        self.gradientView?.layer.addSublayer(gradientLayer)
    }

    private func setupViewWithThumbnail() {
        guard let thumbnail = self.dataHeader.thumbnailView else { return }
        feedbackThumbnail = thumbnail
        if self.showGradient {
            self.createGradientView()
            guard let gradientView = self.gradientView else { return }
            self.addSubview(gradientView)
            setupContainerViewForGradient()
            let textView = self.buildTextBox()
            self.containerTextView.addSubview(textView)
//            textView.autoPinEdge(toSuperviewEdge: .leading, withInset: innerMargin)
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: innerMargin).isActive = true
//            textView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0)
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            setupThumbnailForGradient()
            setupContainerTextViewForGradient(thumbnail, textView)
        } else {
            if separator { buildSeparator(distanceFromTop: thumbnail.bounds.height/2) }
            self.addSubview(thumbnail)
//            thumbnail.autoAlignAxis(toSuperviewAxis: .vertical)
//            thumbnail.autoPinEdge(.top, to: .top, of: self)
            thumbnail.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            self.buildTextBox(viewToPin: thumbnail, withOffset: innerMargin)
        }
    }
    private func setupContainerViewForGradient() {
        if separator { buildSeparator(distanceFromTop: 0)}
        self.addSubview(self.containerView)
//        self.containerView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        self.containerView.autoPinEdge(toSuperviewEdge: .leading, withInset: margin)
        self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
//        self.containerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: margin)
        self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: margin).isActive = true
//        self.containerView.autoPinEdge(toSuperviewEdge: .bottom)
        self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.containerView.backgroundColor = UIColor.clear
        self.containerView.addSubview(self.containerTextView)
//        self.containerTextView.autoPinEdge(toSuperviewEdge: .top)
        self.containerTextView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        self.containerTextView.autoPinEdge(toSuperviewEdge: .leading)
        self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }

    private func setupContainerTextViewForGradient(_ thumbnail: PunaThumbnailBadge, _ textView: UIView) {
        self.containerTextView.autoPinEdge(.trailing, to: .leading, of: thumbnail, withOffset: -innerMargin)
        self.containerTextView.autoPinEdge(toSuperviewEdge: .leading)
        if textView.bounds.height > thumbnailHeightSize {
//            textView.autoPinEdge(toSuperviewEdge: .top, withInset: innerMargin)
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: innerMargin).isActive = true
//            textView.autoPinEdge(toSuperviewEdge: .bottom, withInset: innerMargin)
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            self.containerTextView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
            self.containerTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            self.containerTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//            self.containerTextView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        } else {
//            textView.autoAlignAxis(toSuperviewAxis: .horizontal)
            textView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//            thumbnail.autoPinEdge(toSuperviewEdge: .bottom, withInset: innerMargin)
            thumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: innerMargin).isActive = true
            self.containerTextView.autoSetDimension(.height, toSize: (innerMargin * 2) + thumbnailHeightSize)
        }
    }

    private func setupThumbnailForGradient() {
        self.containerView.addSubview(feedbackThumbnail)
//        feedbackThumbnail.autoPinEdge(toSuperviewEdge: .top, withInset: innerMargin)
        feedbackThumbnail.topAnchor.constraint(equalTo: self.topAnchor, constant: innerMargin).isActive = true
//        feedbackThumbnail.autoPinEdge(toSuperviewEdge: .trailing, withInset: innerMargin)
        feedbackThumbnail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: innerMargin).isActive = true
        feedbackThumbnail.size = .size56
//        feedbackThumbnail.autoSetDimensions(to: CGSize(width: thumbnailHeightSize, height: thumbnailHeightSize))
        feedbackThumbnail.heightAnchor.constraint(equalToConstant: thumbnailHeightSize).isActive = true
        feedbackThumbnail.widthAnchor.constraint(equalToConstant: thumbnailHeightSize).isActive = true
    }

    private func buildTextBox() -> UIView {
        let feedbackText = self.dataHeader.feedbackText
        let textView = PunaFeedbackScreenTextLeftView(screenData: feedbackText, addBottomMargin: self.separator)
        textView.setNeedsLayout()
        textView.layoutIfNeeded()
        return textView

    }

    private func buildTextBox(viewToPin: UIView, withOffset: CGFloat) {
        let feedbackText = self.dataHeader.feedbackText
        let textView = PunaFeedbackScreenTextView(screenData: feedbackText, feedbackColor: self.feedbackColor, addBottomMargin: self.separator)
        self.addSubview(textView)
//        textView.autoPinEdge(.top, to: .bottom, of: viewToPin, withOffset: withOffset)
        textView.topAnchor.constraint(equalTo: self.bottomAnchor, constant: withOffset).isActive = true
//        textView.autoAlignAxis(toSuperviewAxis: .vertical)
        textView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        textView.autoSetDimension(.width, toSize: UIScreen.main.bounds.width - margin * 2 - (innerMargin * 2))
        textView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: UIScreen.main.bounds.width - margin * 2 - (innerMargin * 2)).isActive = true
        textView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: UIScreen.main.bounds.width - margin * 2 - (innerMargin * 2)).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

//        textView.autoPinEdge(.bottom, to: .bottom, of: self)
        textView.setNeedsLayout()
        textView.layoutIfNeeded()
    }

    private func buildSeparator(distanceFromTop: CGFloat) {
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = UIColor.Puna.white
        self.addSubview(separatorView)
//        separatorView.autoPinEdge(.top, to: .top, of: self, withOffset: distanceFromTop)
        separatorView.topAnchor.constraint(equalTo: self.topAnchor, constant: distanceFromTop).isActive = true
//        separatorView.autoPinEdge(toSuperviewEdge: .leading, withInset: margin)
        separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
//        separatorView.autoPinEdge(toSuperviewEdge: .trailing, withInset: margin)
        separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: margin).isActive = true
//        separatorView.autoPinEdge(toSuperviewEdge: .bottom)
        separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorView.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        separatorView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        separatorView.layer.shadowOpacity = 1
        separatorView.layer.shadowRadius = 16
        separatorView.layer.cornerRadius = 6
        separatorView.layer.shouldRasterize = true
        separatorView.layer.rasterizationScale = UIScreen.main.scale
    }

}
