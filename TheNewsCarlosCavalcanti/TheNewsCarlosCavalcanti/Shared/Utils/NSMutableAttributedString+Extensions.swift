//
//  NSMutableAttributedString+Extensions.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 14/02/22.
//

import UIKit

extension NSMutableAttributedString {
    
    func light(string: String,
               fontSize: CGFloat = 14,
               color: UIColor? = nil) -> NSMutableAttributedString {
        
        let font = StyleGuideFont.light(size: fontSize)
        let color = color ?? .black
        
        self.append(NSAttributedString(string: string,
                                       attributes: [.font: font,
                                                    .foregroundColor: color]))
        return self
    }
    
    func regular(string: String,
                 fontSize: CGFloat = 14,
                 color: UIColor? = nil) -> NSMutableAttributedString {
        
        let font = StyleGuideFont.regular(size: fontSize)
        let color = color ?? .black
        
        self.append(NSAttributedString(string: string,
                                       attributes: [.font: font,
                                                    .foregroundColor: color]))
        return self
    }
    
    func bold(string: String,
              fontSize: CGFloat = 14,
              color: UIColor? = nil) -> NSMutableAttributedString {
        
        let font = StyleGuideFont.semibold(size: fontSize)
        let color = color ?? .black
        
        self.append(NSAttributedString(string: string,
                                       attributes: [.font: font,
                                                    .foregroundColor: color]))
        return self
    }
    
    func black(string: String,
              fontSize: CGFloat = 14,
              color: UIColor? = nil) -> NSMutableAttributedString {
        
        let font = StyleGuideFont.black(size: fontSize)
        let color = color ?? .black
        
        self.append(NSAttributedString(string: string,
                                       attributes: [.font: font,
                                                    .foregroundColor: color]))
        return self
    }
}
