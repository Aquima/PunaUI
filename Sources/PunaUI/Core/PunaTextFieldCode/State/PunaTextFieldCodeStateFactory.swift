//
//  PunaTextFieldCodeStateFactory.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
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
