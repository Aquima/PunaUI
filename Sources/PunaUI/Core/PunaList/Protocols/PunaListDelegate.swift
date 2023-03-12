//
//  PunaListDelegate.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 16/10/20.
//

import Foundation
/// Protocol of PunaList behaviour
@objc public protocol PunaListDelegate {

    @objc optional func PunaList(_ listView: PunaList, didSelectRowAt indexPath: IndexPath)

}
