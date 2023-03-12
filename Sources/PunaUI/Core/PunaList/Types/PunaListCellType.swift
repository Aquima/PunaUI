//
//  PunaListCellType.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
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
