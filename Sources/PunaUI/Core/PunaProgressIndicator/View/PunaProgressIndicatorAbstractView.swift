//
//  
//  PunaProgressIndicatorAbstractView.swift
//  PunaUI
//
//  Created by Juan Andres Vasquez Ferrer on 30-11-20.
//
//

import UIKit

class PunaProgressIndicatorAbstractView: UIView, PunaProgressIndicatorView {

    @IBOutlet weak var componentView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var containerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var circularProgressBar: PunaCircularProgressBar!

    var config: PunaProgressIndicatorViewConfig
    init(withConfig config: PunaProgressIndicatorViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = PunaProgressIndicatorViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: PunaProgressIndicatorViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(componentView)
        componentView.translatesAutoresizingMaskIntoConstraints = false
        componentView.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()
    }

    /// Override this method on each ProgressIndicator View to setup its unique components
    func updateView() {
        guard let size = config.size else { return }
        self.containerViewHeightConstraint.constant = size.height
        self.circularProgressBar.ringWidth = size.strokeWidth
        self.circularProgressBar.color = config.tint
        self.textLabel.text = config.label
        self.textLabel.textColor = config.textColor
        self.textLabel.font = size.textFont
        let labelIsAvailable = config.label != nil
        self.stackView.spacing = labelIsAvailable ? size.textSpacing : 0
        let axis: NSLayoutConstraint.Axis = size.horizontalDistribution ? .horizontal : .vertical
        self.stackView.axis = axis
    }

    func startAnimation(type: PunaCircularProgressBar.AnimationType) {
        self.circularProgressBar.startAnimation(type)
    }

    func stopAnimation() {
        self.circularProgressBar.stopAnimation()
    }
}
