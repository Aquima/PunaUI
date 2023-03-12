//
//  PunaDispatchQueueType.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import Foundation

protocol PunaDispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueue: PunaDispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
}
