//
//  PunaRadioButtonsGroupFactory.swift
//  PunaUI
//
//  Created by Daniel Esteban Beltran Beltran on 10/06/21.
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
