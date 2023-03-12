//
//  PunaTextFieldAbstractView.swift
//  PunaUI
//
//  Created by Martin Damico on 12/03/2020.
//

import Foundation
import AVFoundation
import UIKit

typealias PunaInputView = UIView & UITextInput

class PunaTextFieldAbstractView: UIView, PunaTextFieldView {

    @IBOutlet weak var fieldView: PunaInputView!
    @IBOutlet var view: UIView!

    @IBOutlet weak var labelLabel: UILabel!
    @IBOutlet weak var helperLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var helperIconImageView: UIImageView!
    @IBOutlet weak var helperLeadingToLabelLeading: NSLayoutConstraint!

    var borderLayer: CAShapeLayer?
    var text: String = ""
    var attributeText: NSAttributedString?
    var customInputView: UIView?
    var customInputAccessoryView: UIView?
    var innerTextField: UITextField?
    weak var delegate: PunaTextFieldViewDelegate?

    var textInputView: UIView {
        get {
            fieldView
        }
    }

    var config: PunaTextFieldViewConfig

    override func accessibilityActivate() -> Bool {
        config.accessibilityActivated?()
        return true
    }

    init(withConfig config: PunaTextFieldViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = PunaTextFieldViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: PunaTextFieldViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(view)
        view.pinToSuperview()
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()
        self.backgroundColor = .clear

        self.clipsToBounds = true
        self.fieldView.layer.borderWidth = 0
    }

    /// Override this method on each Message View to setup its unique components
    func updateView() {
        if let icon = config.helperIcon, !icon.isEmpty {
            helperIconImageView.isHidden = false
            PunaIconsProvider.loadIcon(name: icon, placeItInto: helperIconImageView)
            helperIconImageView.backgroundColor = config.helperIconBgColor
            helperIconImageView.tintColor = config.helperIconColor
            helperLeadingToLabelLeading.priority = .defaultLow
            helperLeadingToLabelLeading.constant = 12
        } else {
            helperIconImageView.isHidden = true
            helperLeadingToLabelLeading.priority = .defaultHigh
            helperLeadingToLabelLeading.constant = 6
        }

        self.updateLabel(text: config.labelText, label: self.labelLabel, style: config.labelStyle)
        self.updateLabel(text: config.helperText, label: self.helperLabel, style: config.helperStyle)

        // update border
        updateBorder()
        fieldView.backgroundColor = config.inputBgColor
        // set counter label with right count
        var counterTxt: String?
        if config.counter > 0 {
            let length = self.text.count
            counterTxt = "\(length) / \(config.counter)"
        }
        self.updateLabel(text: counterTxt, label: self.counterLabel, style: config.counterStyle)
    }

    private func updateLabel(text: String?, label: UILabel, style: PunaFontStyle) {
        guard let txt = text, !txt.isEmpty else {
            label.text = ""
            label.isHidden = true
            return
        }
        label.text = txt
        label.accessibilityLabel = txt
        label.isHidden = false
        label.setPunaStyle(style: style)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateBorder()
    }

    func updateBorder() {
        let dashed = self.config.textFieldBorderDashed
        let color = self.config.textFieldBorderColor
        let width = self.config.textFieldBorderWidth
        let radious = self.config.textFieldBorderRadious

        let bounds = fieldView.bounds
        self.borderLayer?.removeFromSuperlayer()
        self.fieldView.layer.cornerRadius = radious
        if dashed {
            self.borderLayer = PunaTextFieldBorderLayerDashed(color: color, bounds: bounds, width: width, radious: radious)
        } else {
            self.borderLayer = PunaTextFieldBorderLayerDefault(color: color, bounds: bounds, width: width, radious: radious)
        }
        self.fieldView.layer.addSublayer(borderLayer!)
    }

    func clear() {
        self.text = ""
    }

    func checkLengthAndUpdateCounterLabel() {
        let maxLength = Int(config.counter)
        guard maxLength > 0 else { return } // dont check length if counter = 0

        if self.text.count > maxLength { // don't trim string if maxLength >= currentText length
            self.text = String(self.text.prefix(maxLength))
            DispatchQueue.main.async { [weak self] in // for some reason if you paste text that has to be trimmed the cursor doesn't move to the end of the text, this is a workaround for that case
                guard let fromRange = self?.fieldView.endOfDocument, let toRange = self?.fieldView.endOfDocument else { return }
                self?.fieldView.selectedTextRange = self?.fieldView.textRange(from: fromRange, to: toRange)
            }

        } else if self.text.count == maxLength {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        self.counterLabel.text = "\(self.text.count) / \(config.counter)"
    }

    override func resignFirstResponder() -> Bool {
        return fieldView.resignFirstResponder()
    }

    override func becomeFirstResponder() -> Bool {
        return fieldView.becomeFirstResponder()
    }

    override var isFirstResponder: Bool {
        return fieldView.isFirstResponder
    }
}
