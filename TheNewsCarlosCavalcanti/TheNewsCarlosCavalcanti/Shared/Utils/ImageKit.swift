//
//  ImageKit.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 11/02/22.
//

import Foundation
import SDWebImage

// MARK: - Download Image

extension UIImageView {
    
    func setImage(with url: URL?, cacheEnabled: Bool = true, callback: ((Error?) -> Void)? = nil) {
        var options: SDWebImageOptions = []
        let placeholder = UIImage.TNImage.placeholder
        
        if !cacheEnabled {
            options = [.refreshCached]
        }
        
        self.sd_imageTransition = .fade
        self.sd_setImage(with: url, placeholderImage: placeholder, options: options, progress: nil, completed: { (_, error, _, _) in
            callback?(error)
        })
    }
    
    func setImage(fromURL stringURL: String?) {
        guard let urlFormatted: String = stringURL?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? stringURL,
        let url = URL(string: urlFormatted) else {
            self.image = UIImage.TNImage.placeholder
            return
        }
        
        self.setImage(with: url) { [weak self] ( error ) in
            if error != nil {
                self?.image = UIImage.TNImage.placeholder
            }
        }
    }
}
