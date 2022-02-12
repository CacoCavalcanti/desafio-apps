//
//  TNStyleGuideFont.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import UIKit

struct StyleGuideFont {
    static func thin(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin", size: size) ?? UIFont.systemFont(ofSize: size, weight: .thin)
    }
    
    static func thinItalic(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-ThinItalic", size: size) ?? UIFont.systemFont(ofSize: size, weight: .thin)
    }
    
    static func light(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func semibold(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func black(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black", size: size) ?? UIFont.systemFont(ofSize: size, weight: .black)
    }
}

enum StyleGuideTextStyle: Equatable {
    case newsListSection
    case newsListTitle
    case newsListCoverTitle
    case newsListCoverSection
    
    var font: UIFont {
        switch self {
        case .newsListSection:
            return StyleGuideFont.black(size: 12)
        case .newsListCoverSection:
            return StyleGuideFont.black(size: 14)
        case .newsListCoverTitle:
            return StyleGuideFont.bold(size: 20)
        case .newsListTitle:
            return StyleGuideFont.black(size: 16)
        }
    }
    
    static func == (lhs: StyleGuideTextStyle, rhs: StyleGuideTextStyle) -> Bool {
        return lhs.font == rhs.font
    }
}


