//
//  PunaBaseTooltipView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

protocol PunaBaseTooltipViewDelegate: AnyObject {
    func onDismissed()
}

class PunaBaseTooltipView: UIView {

    // MARK: - properties

    weak var presentingView: UIView?
    weak var delegate: PunaBaseTooltipViewDelegate?
    private var arrowTip = CGPoint.zero
    private let config: PunaTooltipViewConfig
    private let content: UIView
    private let cornerRadius: CGFloat = 6
    var bubblePosition: PunaTooltipPosition = .top
    private static let fullSizeRightInset = CGFloat(16.0)
    private static let fullSizeLeftInset = CGFloat(16.0)
    private let maxFullSize = UIScreen.main.bounds.width - fullSizeRightInset - fullSizeLeftInset

    // arrow properties
    private let arrowHeight: CGFloat = 8
    private let arrowWidth: CGFloat = 16
    private let arrowSpacing: CGFloat = 10

    private var scrollObserve: NSKeyValueObservation?

    // Animations properties
     let animationDuration: TimeInterval = 0.2
     let animationTransform: CGFloat = -10

    // MARK: - Initializer -

    internal init (content: UIView, config: PunaTooltipViewConfig) {
        self.content = content
        self.config = config
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        self.scrollObserve?.invalidate()
    }

    // MARK: - Private methods -
    fileprivate func computeFrame(arrowPosition position: PunaTooltipPosition, refViewFrame: CGRect, superviewFrame: CGRect, sizeStyle: PunaTooltipWidthSize) -> CGRect {
        let xOrigin: CGFloat
        let yOrigin: CGFloat
        let tipViewSize = getTipViewSize(position: self.bubblePosition, superViewFrame: superviewFrame, sizeStyle: sizeStyle)

        switch position {
        case .bottom:
            xOrigin = refViewFrame.center.x - tipViewSize.width / 2
            yOrigin = refViewFrame.maxY
        case .top:
            xOrigin = refViewFrame.center.x - tipViewSize.width / 2
            yOrigin = refViewFrame.origin.y - tipViewSize.height
        case .left:
            xOrigin = refViewFrame.origin.x - tipViewSize.width
            yOrigin = refViewFrame.center.y - tipViewSize.height / 2
        case .right:
            xOrigin = refViewFrame.origin.x + refViewFrame.width
            yOrigin = refViewFrame.center.y - tipViewSize.height / 2
        }

        var frame = CGRect(x: xOrigin, y: yOrigin, width: tipViewSize.width, height: tipViewSize.height)

        frame.origin = adjustFrame(frame, forSuperviewFrame: superviewFrame, refViewFrame: refViewFrame)

        return frame
    }

    fileprivate func adjustFrame(_ frame: CGRect, forSuperviewFrame superviewFrame: CGRect, refViewFrame: CGRect) -> CGPoint {

        var adjustXFrame: CGFloat = frame.origin.x
        var adjustYFrame: CGFloat = frame.origin.y

        // adjust horizontally
        if frame.origin.x < 0 {
            adjustXFrame =  refViewFrame.center.x - (arrowSpacing + arrowWidth)
        }

        if frame.maxX > superviewFrame.width {
            adjustXFrame = superviewFrame.width - frame.width - (superviewFrame.width - refViewFrame.center.x) + arrowSpacing + arrowWidth
        }

        // adjust vertically
        if frame.origin.y < 0 {
            adjustYFrame = refViewFrame.center.y - (arrowSpacing + arrowWidth)
        }

        if frame.maxY > superviewFrame.height {
            adjustYFrame = superviewFrame.height - frame.height - (superviewFrame.height - refViewFrame.center.y) + arrowSpacing + arrowWidth
        }

        return CGPoint(x: adjustXFrame, y: adjustYFrame)
    }

    fileprivate func isFrameValid(_ frame: CGRect, forRefViewFrame: CGRect, superViewFrame: CGRect) -> Bool {
        return !frame.intersects(forRefViewFrame) &&
            frame.maxY <= superViewFrame.height && frame.maxX <= superViewFrame.maxX
    }

    func arrange(withinSuperview superview: UIView, sizeStyle: PunaTooltipWidthSize) {

        guard let presentingView = presentingView else { return }
        var position = bubblePosition
        let refViewFrame = presentingView.convert(presentingView.bounds, to: superview)

        let superviewFrame: CGRect
        if let scrollview = superview as? UIScrollView {
            superviewFrame = CGRect(origin: scrollview.frame.origin, size: scrollview.contentSize)
            setupEventFor(scrollview)
        } else {
            superviewFrame = superview.frame
        }

        var frame = computeFrame(arrowPosition: position, refViewFrame: refViewFrame, superviewFrame: superviewFrame, sizeStyle: sizeStyle)

        frame.origin.x = sizeStyle == .fullSize ? PunaBaseTooltipView.fullSizeLeftInset : frame.origin.x

        if !isFrameValid(frame, forRefViewFrame: refViewFrame, superViewFrame: superviewFrame) {
            let (newFrame, newPosition) = createValidFrame(
                frame,
                currentPosition: position,
                refViewFrame: refViewFrame,
                superViewFrame: superviewFrame,
                sizeStyle: sizeStyle
            )
            frame = newFrame
            position = newPosition
        }

        self.arrowTip = calculateArrowTipPoint(frame: frame, position: position, refViewFrame: refViewFrame, sizeStyle: sizeStyle)

        self.frame = frame
    }

    fileprivate func setupEventFor(_ scrollView: UIScrollView) {
        scrollObserve = scrollView.observe(\UITableView.contentOffset, options: .new) { [weak self] _, _ in
            self?.scrollObserve?.invalidate()
            self?.dismiss()
        }
    }

    fileprivate func createValidFrame(_ frame: CGRect, currentPosition: PunaTooltipPosition, refViewFrame: CGRect, superViewFrame: CGRect, sizeStyle: PunaTooltipWidthSize) -> (CGRect, PunaTooltipPosition) {

        var newFrame: CGRect = .zero
        var newPosition: PunaTooltipPosition = .top

        for value in PunaTooltipPosition.allCases where value != currentPosition {
            let frame = computeFrame(arrowPosition: value, refViewFrame: refViewFrame, superviewFrame: superViewFrame, sizeStyle: sizeStyle)
            if isFrameValid(frame, forRefViewFrame: refViewFrame, superViewFrame: superViewFrame) {
                newFrame = frame
                newPosition = value
                bubblePosition = value
                break
            }
        }

        return (newFrame, newPosition)
    }

    fileprivate func calculateArrowTipPoint(frame: CGRect, position: PunaTooltipPosition, refViewFrame: CGRect, sizeStyle: PunaTooltipWidthSize) -> CGPoint {

        let tipViewSize = self.getTipViewSize(position: position, sizeStyle: sizeStyle)

        switch position {
        case .top, .bottom:
            let arrowTipXOrigin: CGFloat
            if frame.width < refViewFrame.width {
                arrowTipXOrigin = tipViewSize.width / 2
            } else {
                arrowTipXOrigin = abs(frame.origin.x - refViewFrame.center.x)
            }

            let yPosition = position == .top ? tipViewSize.height : 0

            return CGPoint(x: arrowTipXOrigin, y: yPosition)

        case .left, .right:
            let arrowTipYOrigin: CGFloat
            if frame.height < refViewFrame.height {
                arrowTipYOrigin = tipViewSize.height / 2
            } else {
                arrowTipYOrigin = abs(frame.origin.y - refViewFrame.center.y)
            }

            let xPosition = bubblePosition == .right ? 0 : tipViewSize.width

            return CGPoint(x: xPosition, y: arrowTipYOrigin)

        }
    }

    // MARK: - Drawing -

    fileprivate func drawBubble(_ bubbleFrame: CGRect, arrowPosition: PunaTooltipPosition, context: CGContext) {

        let contourPath = CGMutablePath()

        contourPath.move(to: CGPoint(x: arrowTip.x, y: arrowTip.y))

        switch arrowPosition {

        case .top, .bottom:

            let firstLineX = arrowTip.x - arrowWidth / 2
            let firstLineY = arrowTip.y + (arrowPosition == .top ? -1 : 1) * arrowHeight
            let firstLinePoint = CGPoint(x: firstLineX, y: firstLineY)
            contourPath.addLine(to: firstLinePoint)

            if arrowPosition == .top {
                drawBubbleBottomShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            } else {
                drawBubbleTopShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            }

            let secondLineX = arrowTip.x + arrowWidth / 2
            let secondLineY = arrowTip.y + (arrowPosition == .top ? -1 : 1) * arrowHeight
            let pointRight = CGPoint(x: secondLineX, y: secondLineY)
            contourPath.addLine(to: pointRight)

        case .left, .right:

            let firstLineX = arrowTip.x + (arrowPosition == .left ? -1 : 1) * arrowHeight
            let firstLineY = arrowTip.y - arrowWidth / 2
            let firstLinePoint = CGPoint(x: firstLineX, y: firstLineY)
            contourPath.addLine(to: firstLinePoint)

            if arrowPosition == .left {
                drawBubbleRightShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            } else {
                drawBubbleLeftShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
            }

            let secondLineX = arrowTip.x + (arrowPosition == .left ? -1 : 1) * arrowHeight
            let secondLineY = arrowTip.y + arrowWidth / 2
            let pointRight = CGPoint(x: secondLineX, y: secondLineY)
            contourPath.addLine(to: pointRight)
        }

        contourPath.closeSubpath()
        context.addPath(contourPath)
        context.clip()

        paintBubble(context)
    }

    fileprivate func drawBubbleBottomShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {

        path.addArc(tangent1End: CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height), tangent2End: CGPoint(x: frame.origin.x, y: frame.origin.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.origin.x, y: frame.origin.y), tangent2End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y), tangent2End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height), tangent2End: CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height), radius: cornerRadius)
    }

    fileprivate func drawBubbleTopShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {

        let arc1FirstTangent = CGPoint(x: frame.origin.x, y: frame.origin.y)
        let arc1SecondTangent = CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height)
        path.addArc(tangent1End: arc1FirstTangent,
                    tangent2End: arc1SecondTangent,
                    radius: cornerRadius)

        let arc2FirstTangent = CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height)
        let arc2SecondTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height)
        path.addArc(tangent1End: arc2FirstTangent,
                    tangent2End: arc2SecondTangent,
                    radius: cornerRadius)

        let arc3FirstTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height)
        let arc3SecondTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y)
        path.addArc(tangent1End: arc3FirstTangent,
                    tangent2End: arc3SecondTangent,
                    radius: cornerRadius)

        let arc4FirstTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y)
        let arc4SecondTangent = CGPoint(x: frame.origin.x, y: frame.origin.y)
        path.addArc(tangent1End: arc4FirstTangent,
                    tangent2End: arc4SecondTangent,
                    radius: cornerRadius)
    }

    fileprivate func drawBubbleRightShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {

        let arc1FirstTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y)
        let arc1SecondTangent = CGPoint(x: frame.origin.x, y: frame.origin.y)
        path.addArc(tangent1End: arc1FirstTangent,
                    tangent2End: arc1SecondTangent,
                    radius: cornerRadius)

        let arc2FirstTangent = CGPoint(x: frame.origin.x, y: frame.origin.y)
        let arc2SecondTangent = CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height)
        path.addArc(tangent1End: arc2FirstTangent,
                    tangent2End: arc2SecondTangent,
                    radius: cornerRadius)

        let arc3FirstTangent = CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height)
        let arc3SecondTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height)
        path.addArc(tangent1End: arc3FirstTangent,
                    tangent2End: arc3SecondTangent,
                    radius: cornerRadius)

        let arc4FirstTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height)
        let arc4SecondTangent = CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y)
        path.addArc(tangent1End: arc4FirstTangent,
                    tangent2End: arc4SecondTangent,
                    radius: cornerRadius)
    }

    fileprivate func drawBubbleLeftShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {

        path.addArc(tangent1End: CGPoint(x: frame.origin.x, y: frame.origin.y), tangent2End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y), tangent2End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.origin.x + frame.width, y: frame.origin.y + frame.height), tangent2End: CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.origin.x, y: frame.origin.y + frame.height), tangent2End: CGPoint(x: frame.origin.x, y: frame.origin.y), radius: cornerRadius)
    }

    fileprivate func paintBubble(_ context: CGContext) {
        context.setFillColor(config.backgroundColor.cgColor)
        context.fill(bounds)
    }

    fileprivate func drawShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shadowOffset = config.shadowOffset
        self.layer.shadowRadius = config.shadowRadius
        self.layer.shadowColor = config.shadowColor.cgColor
        self.layer.shadowOpacity = Float(config.shadowOpacity)
    }

    override open func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let bubbleFrame = getBubbleFrame(sizeStyle: config.sizeStyle)
        context.saveGState()
        drawBubble(bubbleFrame,
                   arrowPosition: bubblePosition,
                   context: context)
        setupContentView()
        drawShadow()
        context.restoreGState()
    }

    private func setupContentView() {

        let tipSize = self.arrowHeight

        let extraSpacingLeft = self.bubblePosition == .right ? tipSize : 0
        let extraSpacingRight = self.bubblePosition == .left ? tipSize : 0
        let extraSpacingTop = self.bubblePosition == .bottom ? tipSize : 0
        let extraSpacingBottom = self.bubblePosition == .top ? tipSize : 0

        addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(
                equalTo: topAnchor,
                constant: extraSpacingTop
            ),
            content.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -extraSpacingRight
            ),
            content.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: extraSpacingLeft
            ),
            bottomAnchor.constraint(
                equalTo: content.bottomAnchor,
                constant: extraSpacingBottom
            )
        ])
    }

    private func getBubbleFrame(sizeStyle: PunaTooltipWidthSize) -> CGRect {
        let bubbleWidth: CGFloat
        let bubbleHeight: CGFloat
        let bubbleXOrigin: CGFloat
        let bubbleYOrigin: CGFloat
        let tipViewSize = self.getTipViewSize(position: bubblePosition, sizeStyle: sizeStyle)

        switch bubblePosition {
        case .top, .bottom:

            bubbleWidth = tipViewSize.width
            bubbleHeight = tipViewSize.height - arrowHeight

            bubbleXOrigin = 0
            bubbleYOrigin = bubblePosition == .top ? 0 : arrowHeight

        case .right, .left:

            bubbleWidth = tipViewSize.width - arrowHeight
            bubbleHeight = tipViewSize.height

            bubbleXOrigin = bubblePosition == .left ? 0 : arrowHeight
            bubbleYOrigin = 0
        }

        return CGRect(x: bubbleXOrigin, y: bubbleYOrigin, width: bubbleWidth, height: bubbleHeight)
    }

    func getContentSize(sizeStyle: PunaTooltipWidthSize = .dynamic) -> CGSize {
        let horizontalPriority = UILayoutPriority(750)
        let verticalPriority = UILayoutPriority(749)
        let maxWidthSize = sizeStyle == .fullSize ? maxFullSize : self.config.maxWidth
        let targetSize = CGSize(width: maxWidthSize, height: 0)

        let candidateSize = content.systemLayoutSizeFitting(.zero)

        let sizeIsEnough = candidateSize.width <= maxWidthSize

        if sizeIsEnough {
            return candidateSize
        }

        return content.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: horizontalPriority,
            verticalFittingPriority: verticalPriority
        )
    }

    private func getContentRect(from bubbleFrame: CGRect) -> CGRect {
        let contentSize = self.getContentSize()
        return CGRect(
            x: bubbleFrame.origin.x,
            y: bubbleFrame.origin.y,
            width: contentSize.width,
            height: contentSize.height
        )
    }

    private func getTipViewSize(position: PunaTooltipPosition, superViewFrame: CGRect = .zero, sizeStyle: PunaTooltipWidthSize) -> CGSize {
        let contentSize = self.getContentSize(sizeStyle: sizeStyle)
        let width = sizeStyle == .fullSize ? maxFullSize : contentSize.width
        let height = contentSize.height + arrowHeight
        return CGSize(width: width, height: height)
    }
}

// MARK: - CGRect extension -

fileprivate extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.origin.x + self.width / 2, y: self.origin.y + self.height / 2)
    }
}
