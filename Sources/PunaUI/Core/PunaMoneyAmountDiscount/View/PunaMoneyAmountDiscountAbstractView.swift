//
//  
//  PunaDiscountAbstractView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

class PunaMoneyAmountDiscountAbstractView: UIView, PunaMoneyAmountDiscountView {
    @IBOutlet weak var componentView: UIView!
    @IBOutlet weak var discountLabel: UILabel!

    var config: PunaMoneyAmountDiscountViewConfig
    init(withConfig config: PunaMoneyAmountDiscountViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = PunaMoneyAmountDiscountViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: PunaMoneyAmountDiscountViewConfig) {
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
        guard let configSizeString = config.size,
              let size = getSizeFor(configSizeString, isForSuperScript: false) else { return }
        discountLabel.font = discountLabel.font.withSize(size)
        discountLabel.text = "\(config.discountValue ?? 0)% OFF"
        discountLabel.textColor = PunaStyleSheetManager.styleSheet.textColorPositive
    }

    private func getSizeFor(_ size: PunaMoneyAmountSize, isForSuperScript: Bool) -> CGFloat? {
        let sizeString = PunaMoneyAmountSize.keyFor(size)
        guard let size = NumberFormatter().number(from: sizeString) else {return nil}
        return CGFloat(truncating: size)
    }
}
