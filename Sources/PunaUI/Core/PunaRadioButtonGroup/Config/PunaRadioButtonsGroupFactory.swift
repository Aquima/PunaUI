//
//  PunaRadioButtonsGroupFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

class PunaRadioButtonsGroupFactory {
    static func provide(_ items: [PunaRadioButtonItem], with align: PunaRadioButtonAlign) -> [PunaRadioButton] {
        items.map { item in
            PunaRadioButton(
                type: item.type,
                align: align,
                status: .unselected,
                title: item.text)
        }
    }
}
