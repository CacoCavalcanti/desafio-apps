//
//  UIButton+Extensions.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import UIKit

extension UIButton {
    public func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.backgroundColor = color
    }
    
    public func setupNavigationItem(image: UIImage, withSize size: Int) {
        let iconImage = image
        self.frame = CGRect(x: 0, y: 0, width: size, height: size)
        self.tintColor = TNStyleGuide.Color.white
        self.setImage(iconImage, for: .normal)
    }
}
