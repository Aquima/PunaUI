//
//  PunaTextFieldLabelView.swift
//  PunaUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation
import UIKit

class PunaTextFieldLabelView: UIView {
    private(set) var text: String?
    private var style: PunaFontStyle?
    private static let smallMargin: CGFloat = 8

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(text: String, style: PunaFontStyle, forceLeftPadding leftPadding: CGFloat = PunaTextFieldLabelView.smallMargin, forceRightPadding rightPadding: CGFloat = PunaTextFieldLabelView.smallMargin) {
        self.init()

        self.text = text
        self.style = style
        setUp(leftPadding: leftPadding, rightPadding: rightPadding)
    }

    func setUp(leftPadding: CGFloat, rightPadding: CGFloat) {
        guard let text = self.text, let style = self.style else {
            return
        }

        let label = UILabel()
        label.text = text
        label.setPunaStyle(style: style)
        label.sizeToFit()
        self.addSubview(label)
        label.pinToSuperview(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
    }
}
