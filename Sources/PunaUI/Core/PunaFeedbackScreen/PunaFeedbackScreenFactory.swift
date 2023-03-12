//
//  PunaFeedbackScreenFactory.swift
//  PunaUI
//
//  Created by JULIAN BRUNO on 17/08/2021.
//

import Foundation
@objc
public class PunaFeedbackScreenFactory: NSObject {

    @objc
    public static func createPunaFeedbackScreenSimple(feedbackColor: PunaFeedbackScreenColor, header: PunaFeedbackScreenHeader, body: PunaFeedbackScreenScreenBody?, actions: PunaFeedbackScreenActions) -> PunaFeedbackScreenView {
        header.thumbnail?.color = feedbackColor
        header.thumbnailView = PunaFeedbackScreenBadgeFactory.createThumbnailBadgeView(thumbnailInfo: header.thumbnail)
        let PunaFeedbackData = PunaFeedbackScreenData(type: .simple, feedbackColor: feedbackColor, header: header, body: body)

        return PunaFeedbackScreenView(data: PunaFeedbackData, actions: actions)
    }

    @objc
    public static func createPunaFeedbackScreenCongrats (header: PunaFeedbackScreenHeader, body: PunaFeedbackScreenScreenBody?, actions: PunaFeedbackScreenActions) -> PunaFeedbackScreenView {
        header.thumbnail?.color = .green
        header.thumbnailView = PunaFeedbackScreenBadgeFactory.createThumbnailBadgeView(thumbnailInfo: header.thumbnail)
        let PunaFeedbackData = PunaFeedbackScreenData(type: .congrats, feedbackColor: PunaFeedbackScreenColor.green, header: header, body: body)
        return PunaFeedbackScreenView(data: PunaFeedbackData, actions: actions)
    }
}
