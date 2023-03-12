//
//  PunaListCellTypeFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation

class PunaListCellTypeFactory {
    static func provideType(withthumbnail thumbnail: PunaThumbnail? = nil) -> PunaListCellTypeProtocol {
        return PunaListCellType(thumbnail: thumbnail)
    }
}
