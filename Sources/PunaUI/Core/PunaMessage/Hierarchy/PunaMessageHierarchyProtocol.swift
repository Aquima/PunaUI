//
//  PunaMessageHierarchyProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import UIKit

internal protocol PunaMessageHierarchyProtocol {
    var backgroundColor: UIColor { get }
    var dismissButtonColor: UIColor { get }
    var textColor: UIColor { get }
    var pipeColor: UIColor { get }
    var accentColor: UIColor { get }
    var primaryButtonHierarchy: PunaButtonHierarchyProtocol { get }
    var secondaryButtonHierarchy: PunaButtonHierarchyProtocol { get }
    var linkButtonHierarchy: PunaButtonHierarchyProtocol { get }
    var bodyLinkIsUnderline: Bool { get }
    var bodyLinkTextColor: UIColor { get }
}
