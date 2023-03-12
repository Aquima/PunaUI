//
//  PunaTextFieldActionView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

class PunaTextFieldActionView: UIView {
    private(set) var label: String?
    private var action: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    convenience init(label: String, action: @escaping () -> Void) {
        self.init()
        self.label = label
        self.action = action
        setUp()
    }

    func setUp() {
        guard let label = self.label else {
            return
        }
        let button = PunaButton(text: label, hierarchy: .transparent, size: .medium)
        self.addSubview(button)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        button.pinToSuperview(top: 0, left: 8, bottom: 0, right: 8)
    }

    @objc func tapped(_ btn: UIControl) {
        self.action?()
    }
}
