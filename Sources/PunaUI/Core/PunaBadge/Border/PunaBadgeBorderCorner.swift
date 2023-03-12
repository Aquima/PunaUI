//
//  PunaBadgeBorderCorner.swift
//  PunaUI
//
import UIKit

internal struct PunaBadgeBorderCorner: PunaBadgeBorderProtocol {
    public var corners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
}
