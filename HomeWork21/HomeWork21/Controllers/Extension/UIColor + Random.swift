//
//  UIColor + Random.swift
//  HomeWork21
//
//  Created by Дарья Дубровская on 25.02.22.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1.0
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
