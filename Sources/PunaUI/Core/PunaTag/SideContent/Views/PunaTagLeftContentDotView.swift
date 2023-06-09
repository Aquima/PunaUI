//
//  PunaTagLeftContentDotView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaTagLeftContentDotView: UIView {
    private var text: String?
    private var textColor: UIColor?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(backgroundColor: UIColor, text: String? = nil, textColor: UIColor? = nil) {
        self.init()
        self.backgroundColor = backgroundColor
        self.text = text
        self.textColor = textColor
        setupView()
    }

    func setupView() {
        guard let text = self.text, let textColor = self.textColor else {
            return
        }

        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
        label.font = PunaStyleSheetManager.styleSheet.regularSystemFont(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 24).isActive = true
        label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        self.addSubview(label)
        label.pinToSuperview(top: 0, left: 0, bottom: 0, right: 0)
    }
}
