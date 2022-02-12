//
//  UILabel+Extensions.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import Foundation
import UIKit

extension UILabel {
    
    func configure(style: StyleGuideTextStyle,
                   color: UIColor) {
        
        font = style.font
        textColor = color
    }
}
