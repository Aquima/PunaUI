//
//  PunaListCellTypeFactory.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 5/11/20.
//

import Foundation

class PunaListCellTypeFactory {
    static func provideType(withthumbnail thumbnail: PunaThumbnail? = nil) -> PunaListCellTypeProtocol {
        return PunaListCellType(thumbnail: thumbnail)
    }
}
