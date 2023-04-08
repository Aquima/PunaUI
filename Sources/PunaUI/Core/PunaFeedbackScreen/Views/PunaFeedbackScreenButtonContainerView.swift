//
//  PunaFeedbackScreenButtonContainer.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//
import UIKit

class PunaFeedbackScreenButtonContainerView: UIView {
    private let actionButtonText: String
    private let margin: CGFloat = 20

    private lazy var primaryButton: PunaButton = {
        let button = PunaButton(text: self.actionButtonText, hierarchy: .loud, size: .large)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedPrimaryButton), for: .touchUpInside)
        button.accessibilityIdentifier = "Puna_FEEDBACK_VIEW_ PRIMARY_BUTTON"
        return button
    }()

    private let buttonContainerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.clear
        return containerView
    }()

    @objc func tappedPrimaryButton(_ btn: UIControl) {
        self.callback()
    }

    private(set) var callback:() -> Void

    public init(actionButtonText: String, callback:@escaping () -> Void) {
        self.actionButtonText = actionButtonText
        self.callback = callback
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.addSubview(self.buttonContainerView)
        self.buttonContainerView.addSubview(self.primaryButton)
//        self.primaryButton.autoPinEdge(toSuperviewEdge: .top)
        self.primaryButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        self.primaryButton.autoPinEdge(toSuperviewEdge: .leading, withInset: margin)
        self.primaryButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
//        self.primaryButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: margin)
        self.primaryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: margin).isActive = true
//        self.primaryButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: margin)
        self.primaryButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: margin).isActive = true
//        self.primaryButton.autoSetDimension(.height, toSize: 48)
        self.primaryButton.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 48).isActive = true
//        self.buttonContainerView.autoPinEdgesToSuperviewEdges()
        self.buttonContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.buttonContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.buttonContainerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.buttonContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
