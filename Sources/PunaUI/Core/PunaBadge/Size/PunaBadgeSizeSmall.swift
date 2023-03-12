//
//  PunaBadgeSizeSmall.swift
//  PunaUI
//
import UIKit

internal struct PunaBadgeSizeSmall: PunaBadgeSizeProtocol {
    public var font: UIFont = PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 11)

    public var lineSpacing: CGFloat = 0.91

    public var height: CGFloat = 16

    public var borderRadius: CGFloat = 8

    public var verticalPadding: CGFloat = 3
}
