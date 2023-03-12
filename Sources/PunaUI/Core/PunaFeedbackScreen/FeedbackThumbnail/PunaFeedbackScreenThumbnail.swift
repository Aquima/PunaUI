//
//  PunaFeedbackScreenThumbnail.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 1/09/21.
//

import Foundation
import UIKit

@objc public class PunaFeedbackScreenThumbnail: NSObject {
    var image: UIImage?
    var color: PunaFeedbackScreenColor?
    var thumbnailType: PunaFeedbackScreenThumbnailType

    /// Thumbnail with image
    @objc public init(image: UIImage) {
        self.image = image
        self.thumbnailType = .image
    }

    /// Thumbnail with icon
    @objc public init(icon: UIImage) {
        self.image = icon
        self.thumbnailType = .icon
    }

    /// Thumbnail feedbackIcon
    @objc public override init() {
        self.image = nil
        self.thumbnailType = .iconWithoutBadge
    }
}
