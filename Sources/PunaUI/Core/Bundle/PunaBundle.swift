//
//  PunaBundle.swift
//  PunaUI
//
//  Created by Raul Quispe on 05/12/2019.
//

import Foundation

public class PunaBundle {
    public static func bundle() -> Bundle {
//        if let path = Bundle(for: self).path(forResource: "PunaUIResources", ofType: "bundle"),
//            let bundle = Bundle(path: path) {
//            return bundle
//        }
        return Bundle.module
    }
}
