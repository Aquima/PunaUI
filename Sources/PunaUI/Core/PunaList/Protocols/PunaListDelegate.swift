//
//  PunaListDelegate.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
/// Protocol of PunaList behaviour
@objc public protocol PunaListDelegate {

    @objc optional func PunaList(_ listView: PunaList, didSelectRowAt indexPath: IndexPath)

}
