//
//  PunaListProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import Foundation
import UIKit

@objc internal protocol PunaListProtocol {
    func cellForRowAt(indexPath: IndexPath) -> PunaListCell
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func getSeparatorStyle() -> PunaSeparatorStyle
    func getSelectionStyle() -> UITableViewCell.SelectionStyle
    @objc optional func didSelectRowAt(indexPath: IndexPath)
}
