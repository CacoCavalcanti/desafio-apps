//
//  UINavigationBar+Extensions.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import UIKit

extension UINavigationBar {
    
    func setupAppearanceBar() {
        tintColor = TNStyleGuide.Color.white
        backgroundColor = TNStyleGuide.Color.blue
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UINavigationBar.titleFont]
        
        if #available(iOS 15.0, *) {
            standardAppearance.backgroundColor = TNStyleGuide.Color.blue
            standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UINavigationBar.titleFont]
            scrollEdgeAppearance = standardAppearance
        }
    }
    
    static var titleFont: UIFont {
        return StyleGuideFont.black(size: 26)
    }
}
