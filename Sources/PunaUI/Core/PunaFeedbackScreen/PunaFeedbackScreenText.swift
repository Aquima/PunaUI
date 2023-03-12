//
//  PunaFeedbackScreenText.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 17/08/2021.
//

import Foundation

enum PunaFeedbackScreenTextMode {
    case normal
    case highlighted
    case overline
}

@objc
public class PunaFeedbackScreenText: NSObject {

    private(set) var title: String
    private(set) var descriptionText: String?
    private(set) var descriptionLinks: PunaBodyLinks?
    private(set) var highlighted: String?
    private(set) var overline: String?
    private(set) var mode: PunaFeedbackScreenTextMode

    @objc public init(title: String, description: String, descriptionLinks: PunaBodyLinks?, highlighted: String) {
        self.title = title
        self.descriptionText = description
        self.descriptionLinks = descriptionLinks
        self.highlighted = highlighted
        self.mode = .highlighted
    }

    @objc public init(title: String, description: String?, descriptionLinks: PunaBodyLinks?) {
        self.title = title
        self.descriptionText = description
        self.descriptionLinks = descriptionLinks
        self.mode = .normal
    }

    @objc public init(title: String, overline: String) {
        self.title = title
        self.overline = overline
        self.mode = .overline
    }
}
