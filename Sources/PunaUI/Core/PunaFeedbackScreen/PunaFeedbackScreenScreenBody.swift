//
//  PunaFeedbackScreenScreenBody.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 17/08/2021.
//

import Foundation
import UIKit

@objc
public class PunaFeedbackScreenScreenBody: NSObject {

    private(set) var aditionalView: UIView

    @objc public init(view: UIView) {
        self.aditionalView = view
    }
}
