//
//  PunaBadgeSizeLarge.swift
//  PunaUI
//
import Foundation
import CoreFoundation
import UIKit

internal struct PunaBadgeSizeLarge: PunaBadgeSizeProtocol {
    public var font: UIFont = PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 12)

    public var lineSpacing: CGFloat = 1

    public var height: CGFloat = 24

    public var borderRadius: CGFloat = 12

    public var verticalPadding: CGFloat = 7
}
