//
//  PunaListCellType.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 6/11/20.
//

import Foundation
import UIKit

struct PunaListCellType: PunaListCellTypeProtocol {
    var chevronImage: String = "Puna_ui_chevron_right_24"
    var thumbnailLeft: UIImage?

    init(thumbnail: PunaThumbnail? = nil) {
        if let thumbnail = thumbnail {
            thumbnailLeft = thumbnail.image
        }
    }
}
