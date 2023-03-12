//
//  PunaButton.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 03/12/2019.
//

import UIKit

/**
  User interface element the user can tap or click to perform an action.
  Has all the same features as an [UIButton] but reinforces the Puna style.
 
  Is compatible to use via code or via Interface Builder.
 
  The PunaButton has several custom atributes that allows you to specified the button look and feel.
  For style:
    - Loud
    - Quiet
    - Transparent
 
  For size:
    - Large (this is the only size that supports an icon)
    - Medium
    - Small
 
  The responsibility of the PunaButton is to know how it should be represent based on the attributes provided
 */
@objc public class PunaButton: UIControl, PunaAccessibleView {

    /// returns the current selected hierarchy
    @objc public var hierarchy: PunaButtonHierarchy {
        didSet {
            self.update()
        }
    }

    /// returns the current selected size
    @objc public var size: PunaButtonSize {
        didSet {
            self.icon = nil
            self.update()
        }
    }

    /// returns the current text
    @IBInspectable public var text: String {
        didSet {
            view.setText(text)
            accessibilityManager?.viewUpdated()
        }
    }

    /// returns the current selected hierarchy
    @objc public var icon: PunaButtonIcon? {
        didSet {
            self.update()
        }
    }

    internal var view: PunaButtonView
    private var config: PunaButtonViewConfig
    var accessibilityManager: PunaAccessibilityManager?
    var isSpinnerOn: Bool = false {
        didSet {
            accessibilityManager?.viewUpdated()
        }
    }

    @IBInspectable override public var isEnabled: Bool {
        didSet {
            if !isEnabled {
                view.disable()
            } else {
                view.enable()
            }
            accessibilityManager?.viewUpdated()
        }
    }

    /**
    Constructor for button when it is used programmatically where
     
    - Parameters:
         - text  is text that the button will contain
         - style is the type of button you want to draw
         - size is the especification for the button dimensions
         - icon (optional) allows to inyect an icon, only if the size specified is .large
     */
    @objc public init(text: String, hierarchy: PunaButtonHierarchy, size: PunaButtonSize, icon: PunaButtonIcon? = nil) {
        self.hierarchy = hierarchy
        self.size = size
        self.text = text
        self.icon = icon
        self.config = PunaButtonViewConfigFactory.provide(hierarchy: hierarchy, size: size, text: text, icon: icon)
        self.view = PunaButtonViewDefault(config: config)

        assert(!(size != .large && icon != nil), "Yo should not provide an icon if the size is not large")

        super.init(frame: .zero)

        setup()
    }

    /**
     Start the spinner animation if needed and disable user interaction
     */
    @objc public func startSpinner() {
        isUserInteractionEnabled = false
        isSpinnerOn = true
        view.startSpinnerAnimation()
    }

    /**
     Stop the spinner animation if needed and enable user interaction
     */
    @objc public func stopSpinner() {
        isUserInteractionEnabled = true
        isSpinnerOn = false
        view.stopSpinnerAnimation()
    }

    override public func accessibilityActivate() -> Bool {
        return accessibilityManager?.accessibilityActivated() != nil
    }

    /**
     Constructor for the button when it is used by interface builder
     By defect, it will be .loud and .large
     */
    required init?(coder: NSCoder) {
        self.hierarchy = .loud
        self.size = .large
        self.text = "Label"
        self.icon = nil
        self.config = PunaButtonViewConfigFactory.provide(hierarchy: hierarchy, size: size, text: text, icon: icon)
        self.view = PunaButtonViewDefault(config: config)

        super.init(coder: coder)

        setup()

    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        setupTargets()
        drawContentView()
        self.backgroundColor = .clear
        self.view.setText(self.text)
        self.accessibilityManager = PunaButtonAccessibilityManager(view: self)
    }

    private func setupTargets() {
        addTarget(self, action: #selector(touchDown), for: .touchDragInside)
        addTarget(self, action: #selector(touchDown), for: .touchDown)

        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        addTarget(self, action: #selector(touchUp), for: .touchDragOutside)
    }

    private func drawContentView() {
        view = provideContentView()
        addSubview(view)
        view.isUserInteractionEnabled = false
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        accessibilityManager?.viewUpdated()
    }

    private func provideContentView() -> PunaButtonView {
        guard let buttonIcon = self.icon else {
            return PunaButtonViewDefault(config: config)
        }

        if buttonIcon.orientation == .left {
            return PunaButtonViewIconLeft(config: config)
        } else {
            return PunaButtonViewIconRight(config: config)
        }
    }

    private func update() {
        view.removeFromSuperview()
        self.config = PunaButtonViewConfigFactory.provide(hierarchy: hierarchy, size: size, text: text, icon: icon)
        drawContentView()
        accessibilityManager?.viewUpdated()
    }

    /**
    Sets up the icon size to .large with the specified icon
    
    - Parameters:
       - icon the icon with its respective orientation
    */
    @objc public func setLargeSizeWithIcon(_ icon: PunaButtonIcon) {
        self.size = .large
        self.icon = icon
        update()
    }

    /**
     UIControl method used when botton in touched up
     */
    @objc func touchUp() {
        view.touchUp()
    }

    /**
     UIControl method used when botton in touched down
    */
    @objc func touchDown() {
       view.touchDown()
    }

    internal func updateWithCustomConfig(_ config: PunaButtonViewConfig) {
        view.removeFromSuperview()
        self.config = config
        self.text = config.text
        drawContentView()
    }
}

// MARK: - IB inspectable properties
public extension PunaButton {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'hierarchy' instead.")
    @IBInspectable var ibHierarchy: String {
        get {
            return self.hierarchy.toString()
        }
        set(val) {
            self.hierarchy = PunaButtonHierarchy.checkValidEnum(property: "IB hierarchy", key: val)
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'size' instead.")
    @IBInspectable var ibSize: String {
        get {
            return self.size.toString()
        }
        set(val) {
            self.size = PunaButtonSize.checkValidEnum(property: "IB size", key: val)
        }
    }
}
