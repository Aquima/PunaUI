//
//  PunaButtonView.swift
//  PunaUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation
import UIKit
/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaButton
 */
internal protocol PunaButtonView: UIControl {

    func enable()
    func disable()

    func touchUp()
    func touchDown()

    func setText(_ text: String)

    func startSpinnerAnimation()
    func stopSpinnerAnimation()

}
