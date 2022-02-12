//
//  UIAlertController+Extensions.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import UIKit

extension UIAlertController {
    
    static func showTryAgainAlert(withTitle title: String?, message: String, forViewController viewController: UIViewController, dismissHandler: ((UIAlertAction) -> Swift.Void)? = nil, tryAgain: ((UIAlertAction) -> Swift.Void)? = nil, dismissMessage: String = "OK") {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: dismissMessage.uppercased(),
                                      style: .cancel,
                                      handler: dismissHandler))
        alert.addAction(UIAlertAction(title: "Tentar Novamente".uppercased(),
                                      style: .default,
                                      handler: tryAgain))
        viewController.present(alert, animated: true, completion: nil)
    }
}
