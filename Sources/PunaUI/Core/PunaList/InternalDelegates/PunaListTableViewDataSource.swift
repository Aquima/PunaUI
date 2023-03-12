//
//  TableViewDataSource.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation
import UIKit

internal class PunaListTableViewDataSource: NSObject, UITableViewDataSource {

    var listProtocol: PunaListProtocol

    init(listProtocol: PunaListProtocol) {
        self.listProtocol = listProtocol
        super.init()
    }

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return listProtocol.numberOfSections(in: tableView)
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProtocol.tableView(tableView, numberOfRowsInSection: section)
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = listProtocol.cellForRowAt(indexPath: indexPath)
        switch customCell.type {
        case .simple:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PunaListSimpleViewCell", for: indexPath) as? PunaListSimpleViewCell else {
                fatalError("The dequeued cell is not an instance of PunaListSimpleViewCell.")
            }
            cell.selectionStyle = listProtocol.getSelectionStyle()
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listProtocol.getSeparatorStyle())
            return cell
        case .chevron:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PunaListChevronViewCell", for: indexPath) as? PunaListChevronViewCell else {
                fatalError("The dequeued cell is not an instance of PunaListChevronViewCell.")
            }
            cell.selectionStyle = listProtocol.getSelectionStyle()
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listProtocol.getSeparatorStyle())
            return cell
        case .timePicker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PunaListTimePickerViewCell", for: indexPath) as? PunaListTimePickerViewCell else {
                fatalError("The dequeued cell is not an instance of PunaListTimePickerViewCell.")
            }
            cell.selectionStyle = listProtocol.getSelectionStyle()
            cell.display(indexPath: indexPath, customCell: customCell, separatorStyle: listProtocol.getSeparatorStyle())
            return cell

        default:
            return UITableViewCell()
        }
    }
}
