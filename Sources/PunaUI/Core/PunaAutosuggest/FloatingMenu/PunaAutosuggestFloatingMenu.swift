//
//  PunaFloatingMenuList.swift
//  PunaUI
//


import Foundation
import UIKit

class PunaAutosuggestFloatingMenu {
    var availableFrame: CGRect

    private let targetView: UIView
    private let superView: UIView
    private let menu: UIView
    private weak var delegate: PunaAutosuggestFloatingMenuDelegate?
    private let clearView: UIView
    private let config: PunaAutosuggestViewConfig
    private var menuIntrinsicSize: CGFloat = 100

    var animationQueue: [Animation] = []

    class Animation {
        let animation: () -> Void
        let completion: ((Bool) -> Void)?
        init(animation: @escaping () -> Void, completion: ((Bool) -> Void)?) {
            self.animation = animation
            self.completion = completion
        }
    }

    public init(config: PunaAutosuggestViewConfig, targetView: UIView, superView: UIView, menu: UIView, delegate: PunaAutosuggestFloatingMenuDelegate?, availableFrame: CGRect) {
        self.targetView = targetView
        self.superView = superView
        self.delegate = delegate
        self.availableFrame = availableFrame
        self.config = config

        let animatingShadowView = PunaAutosuggestFloatingMenuAnimatingShadowView()

        menu.clipsToBounds = true
        menu.layer.cornerRadius = self.config.menuCornerRadius

        animatingShadowView.addSubview(menu)
        animatingShadowView.contentView = menu
        menu.pinToSuperview()

        self.menu = animatingShadowView

        self.clearView = UIView(frame: superView.bounds)

        let touchDown = UILongPressGestureRecognizer(target: self, action: #selector(clearViewWasTapped))
        touchDown.minimumPressDuration = 0

        self.clearView.addGestureRecognizer(touchDown)
    }

    private func hideFrame(location: PunaAutosuggestFloatingMenuLocation) -> CGRect {
        func hideFrameDown() -> CGRect {
            let targetViewConvertedRect = superView.convert(targetView.bounds, from: targetView)

            let x = targetViewConvertedRect.minX
            let y = targetViewConvertedRect.minY + targetViewConvertedRect.height + self.config.menuPadding
            let width = targetViewConvertedRect.width
            let height: CGFloat = 0

            return CGRect(x: x, y: y, width: width, height: height)
        }

        func hideFrameUp() -> CGRect {
            let targetViewConvertedRect = superView.convert(targetView.bounds, from: targetView)

            let x = targetViewConvertedRect.minX
            let y = targetViewConvertedRect.minY - self.config.menuPadding
            let width = targetViewConvertedRect.width
            let height: CGFloat = 0

            return CGRect(x: x, y: y, width: width, height: height)
        }

        switch location.direction {
        case .down:
            return hideFrameDown()
        case .up:
            return hideFrameUp()
        }
    }

    private func showFrame(location: PunaAutosuggestFloatingMenuLocation) -> CGRect {
        func showFrameDown() -> CGRect {
            let targetViewConvertedRect = superView.convert(targetView.bounds, from: targetView)

            let finalHeight = location.height >= menuIntrinsicSize ? menuIntrinsicSize : location.height - self.config.menuBottomPadding

            let x = targetViewConvertedRect.minX
            let y = targetViewConvertedRect.maxY + self.config.menuPadding
            let width = targetViewConvertedRect.width
            let height = finalHeight

            return CGRect(x: x, y: y, width: width, height: height)
        }

        func showFrameUp() -> CGRect {
            let targetViewConvertedRect = superView.convert(targetView.bounds, from: targetView)

            let finalHeight = location.height >= menuIntrinsicSize ? menuIntrinsicSize : location.height - self.config.menuTopPadding

            let x = targetViewConvertedRect.minX
            let y = targetViewConvertedRect.minY - self.config.menuPadding - finalHeight
            let width = targetViewConvertedRect.width
            let height = finalHeight

            return CGRect(x: x, y: y, width: width, height: height)
        }

        switch location.direction {
        case .down:
            return showFrameDown()
        case .up:
            return showFrameUp()
        }
    }

    private func animationQueuer(animation: Animation) {

        animationQueue.append(animation)
        animationExcecuter(animation: animation)
    }

    private func animationExcecuter(animation: Animation) {
        let oldestAnimation = animationQueue.first
        if animation === oldestAnimation {
            UIView.animate(withDuration: TimeInterval(self.config.menuAnimationDuration), animations: animation.animation) { finish in
                animation.completion?(finish)
                if !self.animationQueue.isEmpty {
                    self.animationQueue.removeFirst()
                }
                if self.animationQueue.count > 0 {
                    self.animationExcecuter(animation: self.animationQueue.first!)
                }
            }
        }
    }

    public func showMenu(intrinsicSize: CGFloat) {
        superView.addSubview(menu)
        superView.addSubview(clearView)
        superView.bringSubviewToFront(clearView)
        superView.bringSubviewToFront(menu)

        let location = PunaAutosuggestFloatingMenuLocationPolicy.preferedLocation(targetView: targetView, superView: superView, availableFrame: availableFrame)
        self.menuIntrinsicSize = intrinsicSize
        menu.frame = self.hideFrame(location: location)
        self.menu.layoutSubviews()
        animationQueuer(animation: Animation.init(animation: {
            self.menu.frame = self.showFrame(location: location)
            self.menu.layoutIfNeeded()

        }, completion: nil))
    }

    public func hideMenu() {
        let location = PunaAutosuggestFloatingMenuLocationPolicy.preferedLocation(targetView: targetView, superView: superView, availableFrame: availableFrame)

        animationQueuer(animation: Animation(animation: {
            self.menu.frame = self.hideFrame(location: location)
            self.menu.layoutIfNeeded()
        }, completion: { _ in
            self.menu.removeFromSuperview()
            self.clearView.removeFromSuperview()
        }))

    }

    public func reloadMenu(with intrinsicSize: CGFloat) {
        self.menuIntrinsicSize = intrinsicSize

        let location = PunaAutosuggestFloatingMenuLocationPolicy.preferedLocation(targetView: targetView, superView: superView, availableFrame: availableFrame)

        animationQueuer(animation: Animation(animation: {
            self.menu.frame = self.showFrame(location: location)
            self.menu.layoutIfNeeded()
        }, completion: nil))
    }

    @objc func clearViewWasTapped() {
        delegate?.didSelectBackground()
    }
}
