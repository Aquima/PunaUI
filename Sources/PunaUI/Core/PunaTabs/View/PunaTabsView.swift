//
//  
//  PunaTabsView.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit
/**
 Internal protocol that specifies the behaviour a view must provide to be a valid representation of an PunaTabs
 */
internal protocol PunaTabsView: UIView {
    var delegate: PunaTabsDelegate? { get set }
    func update(withConfig config: PunaTabsViewConfig)
    func updateSelectedTab(at index: Int, animated: Bool)
    func resetTabsElements()
}

protocol PunaTabsDelegate: AnyObject {
    func didSelectTab(at index: Int)
}
