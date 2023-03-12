//
//  PunaDispatchQueueType.swift
//  PunaUI
//
//  Created by Gerardo Tarazona Caceres on 28/07/21.
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
