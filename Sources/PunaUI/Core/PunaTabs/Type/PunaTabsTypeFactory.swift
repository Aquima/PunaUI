//
//  
//  PunaTabsTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaTabsTypeFactory {
    static func provide(_ type: PunaTabsType) -> PunaTabsTypeProtocol {
        switch type {
        case .fullWidth:
            return PunaTabsFullWidthType()
        case .leftAlign:
            return PunaTabsLeftAlignType()
        }
    }
}
