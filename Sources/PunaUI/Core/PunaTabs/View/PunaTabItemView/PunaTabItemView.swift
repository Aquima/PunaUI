//
//  PunaTabItemView.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 22/07/21.
//

import Foundation
import UIKit

class PunaTabItemView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tabTitle: UILabel!
    var tabSelected: (() -> Void)?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabSelection)))
    }

    func loadNib() {
        let bundle = PunaBundle.bundle()
        bundle.loadNibNamed("PunaTabItemView", owner: self, options: nil)
    }

    func pinXibViewToSelf() {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.pinToSuperview()
    }

    @objc
    func tabSelection() {
        tabSelected?()
    }
}
