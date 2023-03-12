//
//  
//  PunaTabsTypeFactory.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 21/07/21.
//
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
