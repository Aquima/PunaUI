//
//  PunaBadgeSizeDot.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import Foundation
import CoreFoundation
import UIKit

internal struct PunaBadgeSizeDot: PunaBadgeSizeProtocol {

    public var font: UIFont = PunaStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 12)

    public var lineSpacing: CGFloat = 1

    public var height: CGFloat = 8

    public var borderRadius: CGFloat = 4

    public var verticalPadding: CGFloat = 0

    public var horizontalPadding: CGFloat = 0
}
