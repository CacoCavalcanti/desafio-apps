//
//  UIImage+Appearance.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import UIKit

extension UIImage {
    
    struct TNImage {
        static let sandwichBars: UIImage = (UIImage(named: "sandwich_bars")?.withRenderingMode(.alwaysTemplate))!
        static let placeholder: UIImage = (UIImage(named: "placeholder")?.withRenderingMode(.alwaysOriginal))!
    }

}

