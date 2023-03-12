//
//  PunaBulletView.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit

protocol PunaBulletViewDelegate: AnyObject {
    func PunabulletView(urlInteractionAt linkIndex: Int, forBullet bulletIndex: Int)
}

final class PunaBulletView: UIView, UITextViewDelegate {

    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var bulletTextView: UITextView!

    var bulletIndex: Int = 0
    weak var delegate: PunaBulletViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }

    private func setup() {
        self.loadNib()
        self.bulletTextViewSetup()
    }

    private func loadNib() {
        let bundle = PunaBundle.bundle()
        guard let view = bundle.loadNibNamed("PunaBulletView", owner: self, options: nil)?.first as? UIView else {
            return
        }

        view.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    private func bulletTextViewSetup() {
        self.bulletTextView.textContainerInset = .zero
        self.bulletTextView.textContainer.lineFragmentPadding = 0.0
        self.bulletTextView.delegate = self
    }

    func configure(bulletText: NSAttributedString, with PunaStyle: PunaFontStyle, linkTextColor: UIColor, delegate: PunaBulletViewDelegate?, at bulletIndex: Int) {
        self.bulletView.backgroundColor = PunaStyle.textColor
        self.bulletTextView.setPunaStyle(style: PunaStyle)
        self.bulletTextView.attributedText = bulletText
        self.bulletTextView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: linkTextColor]
        self.bulletIndex = bulletIndex
        self.delegate = delegate
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let index = Int(String(describing: URL)) ?? 0
        self.delegate?.PunabulletView(urlInteractionAt: index, forBullet: self.bulletIndex)
        return false
    }
}
