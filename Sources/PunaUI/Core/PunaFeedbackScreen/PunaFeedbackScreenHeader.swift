//
//  PunaFeedbackScreenHeader.swift
//  PunaUI
//
//  Created by Raul Quispe on 23/08/2021.
//

import UIKit

@objc
public class PunaFeedbackScreenHeader: NSObject {
    private(set) var feedbackText: PunaFeedbackScreenText
    private(set) var thumbnail: PunaFeedbackScreenThumbnail?
    var thumbnailView: PunaThumbnailBadge?

    @objc public init(feedbackText: PunaFeedbackScreenText, thumbnailInfo: PunaFeedbackScreenThumbnail) {
        self.feedbackText = feedbackText
        self.thumbnail = thumbnailInfo
    }
}
