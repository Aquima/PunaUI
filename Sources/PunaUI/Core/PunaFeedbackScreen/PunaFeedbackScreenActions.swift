//
//  PunaFeedbackScreenActions.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 02/09/2021.
//
import Foundation

@objc public class PunaFeedbackScreenActions: NSObject {
    let actionButton: PunaFeedbackScreenButton?
    let closeButtonCallback:  (() -> Void)?

    @objc public init(actionButton: PunaFeedbackScreenButton, closeButtonCallback: (() -> Void )?  ) {
        self.actionButton = actionButton
        self.closeButtonCallback = closeButtonCallback
    }

    @objc public init(closeButtonCallback: @escaping (() -> Void )) {
        self.actionButton = nil
        self.closeButtonCallback = closeButtonCallback
    }
}
