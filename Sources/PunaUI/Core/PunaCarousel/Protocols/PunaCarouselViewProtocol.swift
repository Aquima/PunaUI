//
//  PunaCarouselViewProtocol.swift
//  PunaUI
//
//  Created by Alejo Echeguia on 23/03/2021.
//

import Foundation
import UIKit

@objc internal protocol PunaCarouselViewProtocol {
    func cellForRowAt(indexPath: IndexPath) -> UIView
    func numberOfRow() -> Int
    func didSelectItemAt(indexPath: IndexPath)
    func sizeForItemAt(indexPath: IndexPath) -> CGSize
}
