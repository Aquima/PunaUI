//
//  
//  PunaRadioButtonGroup.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 10/06/21.
//
//

import Foundation
import UIKit

@objc public class PunaRadioButtonGroup: UIView {
    internal var contentView: PunaRadioButtonGroupView!

    @objc public var distribution: PunaRadioButtonGroupDistribution = .horizontal {
        didSet {
            updateContentView()
        }
    }

    @objc public var align: PunaRadioButtonAlign = .left {
        didSet {
            updateContentView()
        }
    }

    @objc public var selected: Int = -1 {
        didSet {
            updateContentView()
        }
    }

    @objc public var radioButtons: [PunaRadioButtonItem] = [] {
        didSet {
            updateContentView()
        }
    }

    @objc public var onRadioButtonCheckedChanged: ((Int) -> Void)?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(selected: Int = -1, radioButtons: [PunaRadioButtonItem], align: PunaRadioButtonAlign, distribution: PunaRadioButtonGroupDistribution ) {
        super.init(frame: .zero)

        self.selected = selected
        self.radioButtons = radioButtons
        self.align = align
        self.distribution = distribution

        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func drawContentView(with newView: PunaRadioButtonGroupView) {
        self.contentView = newView
        addSubview(contentView)
        contentView.pinToSuperview()
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

        let config = PunaRadioButtonGroupViewConfigFactory.provideInternalConfig(
            distribution: distribution,
            align: align,
            selected: selected,
            radioButtons: radioButtons)

        contentView.update(withConfig: config)
    }

    /// Should return a view depending on which modifier is selected
    private func provideView() -> PunaRadioButtonGroupView {
        let config = PunaRadioButtonGroupViewConfigFactory.provideInternalConfig(
            distribution: distribution,
            align: align,
            selected: selected,
            radioButtons: radioButtons)
        let radioButtonGroupView = PunaRadioButtonGroupViewDefault(withConfig: config)
        radioButtonGroupView.componentDelegate = self
        return radioButtonGroupView
    }
}

// MARK: - IB interface
public extension PunaRadioButtonGroup {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'distribution' instead.")
    @IBInspectable var ibDistribution: String {
        set(val) {
            self.distribution = PunaRadioButtonGroupDistribution.checkValidEnum(property: "IB distribution", key: val)
        }
        get {
            return self.distribution.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'distribution' instead.")
    @IBInspectable var ibAlign: String {
        set(val) {
            self.align = PunaRadioButtonAlign.checkValidEnum(property: "IB Align", key: val)
        }
        get {
            return self.distribution.toString()
        }
    }
}

extension PunaRadioButtonGroup: PunaRadioButtonGroupDelegate {
    func didSelectIndex(_ index: Int) {
        self.selected = index
        self.onRadioButtonCheckedChanged?(index)
    }
}
