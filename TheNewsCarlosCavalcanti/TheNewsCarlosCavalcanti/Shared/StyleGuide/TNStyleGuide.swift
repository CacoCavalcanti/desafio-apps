//
//  TNStyleGuide.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import UIKit

struct TNStyleGuide {
    private init() { }
    
    struct Color {
        static let greenPositiveColor: UIColor = UIColor(red: 50/255, green: 196/255, blue: 139/255, alpha: 1)
        static let redNegativeColor: UIColor = UIColor(red: 169/255, green: 0/255, blue: 137/255, alpha: 1)
        static let grayActionColor: UIColor = UIColor(red: 150/255, green: 150/255, blue: 170/255, alpha: 1)
        static let redDesableColor: UIColor = UIColor(red: 178/255, green: 51/255, blue: 46/255, alpha: 1)
        static let blueActionColor: UIColor = UIColor(red: 178/255, green: 51/255, blue: 46/255, alpha: 1)
        static let grayFlipside: UIColor = UIColor(red: 31/255, green: 33/255, blue: 36/255, alpha: 1)
        
        //MARK: - Layout Colors
        static let boldBlue = UIColor(red: 18/255, green: 43/255, blue: 77/255, alpha: 1)
        static let darkBlue = UIColor(red: 53/255, green: 70/255, blue: 84/255, alpha: 1)
        static let lightYellow = UIColor(red: 255/255, green: 238/255, blue: 166/255, alpha: 1)
        static let darkPurple = UIColor(red: 96/255, green: 49/255, blue: 119/255, alpha: 1)
        static let lightPurple = UIColor(red: 127/255, green: 44/255, blue: 124/255, alpha: 1)
        static let magenta = UIColor(red: 210/255, green: 29/255, blue: 134/255, alpha: 1)
        static let yellow = UIColor(red: 250/255, green: 182/255, blue: 49/255, alpha: 1)
        static let yellowGradient = UIColor(red: 250/255, green: 182/255, blue: 49/255, alpha: 0.5)
        static let orange = UIColor(red: 212/255, green: 125/255, blue: 79/255, alpha: 1)
        static let green = UIColor(red: 115/255, green: 178/255, blue: 175/255, alpha: 1)
        static let darkOrange = UIColor(red: 150/255, green: 89/255, blue: 93/255, alpha: 1)
        static let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        //MARK: - Layout Colors with Transparency
        
        static let darkBlueTransparent = UIColor(red: 53/255, green: 70/255, blue: 84/255, alpha: 0.8)
    }
}
