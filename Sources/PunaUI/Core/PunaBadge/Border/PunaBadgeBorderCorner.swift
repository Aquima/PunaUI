//
//  PunaBadgeBorderCorner.swift
//  PunaUI
//
//  Created by Raul Quispe on 20/09/21.
//
import UIKit

internal struct PunaBadgeBorderCorner: PunaBadgeBorderProtocol {
    public var corners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
}
