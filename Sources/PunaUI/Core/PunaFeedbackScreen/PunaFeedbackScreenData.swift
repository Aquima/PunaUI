//
//  PunaFeedbackScreenData.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//
import Foundation

class PunaFeedbackScreenData: NSObject {
    let type: PunaFeedbackScreenType
    let feedbackColor: PunaFeedbackScreenColor
    let header: PunaFeedbackScreenHeader
    let body: PunaFeedbackScreenScreenBody?

    init(type: PunaFeedbackScreenType, feedbackColor: PunaFeedbackScreenColor, header: PunaFeedbackScreenHeader, body: PunaFeedbackScreenScreenBody? ) {
        self.type = type
        self.feedbackColor = feedbackColor
        self.header = header
        self.body = body
    }
}
