//
//  PunaTextFieldBorderLayerDashed.swift
//  PunaUI
//
//  Created by Raul Quispe on 1/13/20.
//

import UIKit

class PunaTextFieldBorderLayerDashed: CAShapeLayer {
    convenience init(color: UIColor, bounds: CGRect, width: CGFloat, radious: CGFloat) {
        self.init()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: radious)
        self.strokeColor = color.cgColor
        self.lineDashPattern = [2, 2]
        self.frame = bounds
        self.fillColor = nil
        self.cornerRadius = radious
        self.lineWidth = width
        self.path = path.cgPath
    }
}
