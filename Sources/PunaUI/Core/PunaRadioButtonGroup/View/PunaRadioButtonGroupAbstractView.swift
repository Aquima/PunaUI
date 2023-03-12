//
//  
//  PunaRadioButtonGroupAbstractView.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 10/06/21.
//
//

import UIKit

class PunaRadioButtonGroupAbstractView: UIView, PunaRadioButtonGroupView {
    @IBOutlet weak var componentView: UIView!
    @IBOutlet weak var stackView: UIStackView!

    var config: PunaRadioButtonGroupViewConfig
    private let unselectedItem = -1
    weak var componentDelegate: PunaRadioButtonGroupDelegate?

    init(withConfig config: PunaRadioButtonGroupViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = PunaRadioButtonGroupViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: PunaRadioButtonGroupViewConfig) {
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

    /// Override this method on each Badge View to setup its unique components
    func updateView() {
        verifyBounds()
        resetGroupView()
        addRadioButtonItems()
    }

    private func verifyBounds() {
        guard config.selected < config.radioButtons.count,
              config.selected >= unselectedItem else {
            fatalError("Selected item inside a radio button should be between \(unselectedItem) and \(config.radioButtons.count - 1)")
        }
    }

    private func resetGroupView() {
        stackView.subviews.forEach({ $0.removeFromSuperview() })
        stackView.axis = config.distribution.align
        stackView.spacing = config.distribution.spacing
    }

    private func addRadioButtonItems() {
        for (index, PunaRadioButton) in config.radioButtons.enumerated() {
            setupRadioButton(PunaRadioButton, index)
            stackView.addArrangedSubview(PunaRadioButton)
        }
    }

    private func setupRadioButton(_ PunaRadioButton: PunaRadioButton, _ index: Int) {
        PunaRadioButton.titleNumberOfLines = 1
        PunaRadioButton.setRadioButtonTapped(callback: { [weak self] (_) in
            self?.componentDelegate?.didSelectIndex(index)
        })
        resetErrorIfNeeded(PunaRadioButton)
        PunaRadioButton.status = config.selected == index ? .selected : .unselected
    }

    private func resetErrorIfNeeded(_ PunaRadioButton: PunaRadioButton) {
        if PunaRadioButton.type == .error, config.selected != unselectedItem {
            PunaRadioButton.type = .idle
        }
    }
}
