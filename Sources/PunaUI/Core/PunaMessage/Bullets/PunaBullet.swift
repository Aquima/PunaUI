//
//  Bullet.swift
//  PunaUI
//
//  Created by Martin Ezequiel Becerra on 2/25/21.
//

import Foundation

/// Class to create Body Bullets for an PunaMessage
@objc public final class PunaBullet: NSObject {
    let text: String
    let bodyLinks: PunaBodyLinks?

    public init(text: String, bodyLink: PunaBodyLinks) {
        self.text = text
        self.bodyLinks = bodyLink
    }

    @objc public init(text: String) {
        self.text = text
        self.bodyLinks = nil
    }
}
