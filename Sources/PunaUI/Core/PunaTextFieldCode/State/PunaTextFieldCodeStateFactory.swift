//
//  PunaTextFieldCodeStateFactory.swift
//  PunaUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

final class PunaTextFieldCodeStateFactory {
    static func getState(_ state: PunaTextFieldCodeState) -> PunaTextFieldCodeStateProtocol {
        switch state {
        case .IDLE:
            return PunaTextFieldCodeStateIdle()
        case .ERROR:
            return PunaTextFieldCodeStateError()
        case .DISABLED:
            return PunaTextFieldCodeStateDisabled()
        }
    }
}
