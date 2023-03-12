//
//  PunaBadgeBorderStandard.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import UIKit

internal struct PunaBadgeBorderStandard: PunaBadgeBorderProtocol {
    public var corners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
}
