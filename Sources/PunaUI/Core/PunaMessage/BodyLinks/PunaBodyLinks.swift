//
//  PunaBodyLinks.swift
//  PunaUI
//
//  Created by Marcelo Agustin Gil on 27/07/2020.
//
import Foundation
import CoreFoundation

@objc
public class PunaBodyLinks: NSObject {
    var links: [PunaBodyLink]
    var listener: ((_ index: Int) -> Void)

    public init(links: [PunaBodyLink], listener: @escaping ((_ index: Int) -> Void)) {
        self.links = links
        self.listener = listener
    }

    @objc public init(links: NSArray, listener: @escaping ((_ index: Int) -> Void)) {
        self.links = links as? [PunaBodyLink] ?? []
        self.listener = listener
    }
}
