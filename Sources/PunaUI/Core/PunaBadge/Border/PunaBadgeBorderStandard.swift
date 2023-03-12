//
//  PunaBadgeBorderStandard.swift
//  PunaUI
//
import UIKit

internal struct PunaBadgeBorderStandard: PunaBadgeBorderProtocol {
    public var corners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
}
