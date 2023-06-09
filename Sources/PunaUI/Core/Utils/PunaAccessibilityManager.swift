//
//  PunaAccessibleViewProtocol.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation
import AVFoundation
import UIKit

enum AccessibilityAnnouncement {
    case vibration
    case message(message: String)
    case custom(notification: UIAccessibility.Notification, argument: Any?)
}

protocol PunaAccessibleView {
    var accessibilityManager: PunaAccessibilityManager? { get set}
}

protocol PunaAccessibilityManager {
    init(view: UIView)
    func viewUpdated()
    func accessibilityActivated()
    func makeAnnouncement(type: AccessibilityAnnouncement)
}

extension PunaAccessibilityManager {

    func makeAnnouncement(type: AccessibilityAnnouncement) {
        guard UIAccessibility.isVoiceOverRunning else { return }
        switch type {
        case .vibration:
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        case .message(let message):
            sendMessage(message)
        case .custom(let notification, let argument):
            sendCustomMessage(notification, argument)
        }
    }

    private func sendMessage(_ message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if #available(iOS 11.0, *) {
                let notificationArgument = NSAttributedString(string: message,
                                                              attributes: [NSAttributedString.Key.accessibilitySpeechQueueAnnouncement: true])
                UIAccessibility.post(notification: .announcement, argument: notificationArgument)
            } else {
                UIAccessibility.post(notification: .announcement, argument: message)
            }
        }
    }

    private func sendCustomMessage(_ notification: UIAccessibility.Notification, _ argument: Any?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIAccessibility.post(notification: notification, argument: argument)
        }
    }
}
