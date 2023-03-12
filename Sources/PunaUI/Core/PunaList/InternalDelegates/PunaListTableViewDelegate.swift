//
//  TableViewDelegate.swift
//  PunaUI
//
//  Created by Jonathan Alonso Pinto on 27/10/20.
//

import Foundation
import UIKit

internal class PunaListTableViewDelegate: NSObject, UITableViewDelegate {

    var listProtocol: PunaListProtocol

    init(listProtocol: PunaListProtocol) {
        self.listProtocol = listProtocol
        super.init()
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        listProtocol.didSelectRowAt?(indexPath: indexPath)
    }

    internal func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.numberOfRows(inSection: indexPath.section) - 1 <= indexPath.row {
            guard let cell = cell as? PunaListCell else {
                fatalError("The dequeued cell is not an instance of PunaListSimpleViewCell.")
            }
            cell.setupSeparatorStyle(separatorStyle: .none)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
