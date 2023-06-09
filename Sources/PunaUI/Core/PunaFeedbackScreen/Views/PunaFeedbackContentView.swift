//
//  PunaFeedbackContentView.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit

class PunaFeedbackContentView: UIView {
    private let data: PunaFeedbackScreenData
    let headerView: PunaFeedbackScreenHeaderView

    private let innerMargin: CGFloat = 16
    private let topMargin: CGFloat = 24
    private let margin: CGFloat = 20

    public init(data: PunaFeedbackScreenData) {
        self.data = data
        let separator =  (data.body != nil)
        let showGradient =  (data.body != nil && data.type == .congrats) ? true:false
        self.headerView = PunaFeedbackScreenHeaderView(dataHeader: self.data.header, separator: separator, showGradient: showGradient, feedbackColor: self.data.feedbackColor)
        self.headerView.backgroundColor = UIColor.clear
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints  = false
        self.backgroundColor = .clear
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        var inset: CGFloat = topMargin
        if self.data.body == nil {
            inset = 0.0
        } else if self.data.type == .congrats && self.data.body != nil {
            inset = 56.0
        }
        self.addSubview(self.headerView)
        
        self.headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: inset).isActive = true
        self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        self.headerView.autoPinEdge(toSuperviewEdge: .top, withInset: inset)
//        self.headerView.autoPinEdge(toSuperviewEdge: .leading)
//        self.headerView.autoPinEdge(toSuperviewEdge: .trailing)
        if let body = self.data.body {
            let bodyView = body.aditionalView
            self.addSubview(bodyView)
            bodyView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
//            bodyView.autoPinEdge(toSuperviewEdge: .leading, withInset: margin)
            bodyView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: margin).isActive = true
//            bodyView.autoPinEdge(toSuperviewEdge: .trailing, withInset: margin)
            bodyView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            bodyView.autoPinEdge(toSuperviewEdge: .bottom)
            bodyView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: innerMargin).isActive = true
//            bodyView.autoPinEdge(.top, to: .bottom, of: self.headerView, withOffset: innerMargin)
            bodyView.clipsToBounds = false
            bodyView.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
            bodyView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
            bodyView.layer.shadowOpacity = 0.1
            bodyView.layer.shadowRadius = 16
            bodyView.layer.cornerRadius = 6
            bodyView.layer.shouldRasterize = true
            bodyView.layer.rasterizationScale = UIScreen.main.scale
        } else {
//            self.headerView.autoPinEdge(toSuperviewEdge: .bottom)
            self.headerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.clipsToBounds = false
    }

}
