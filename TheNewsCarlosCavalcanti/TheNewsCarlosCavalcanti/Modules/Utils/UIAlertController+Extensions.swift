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
    
    static func showGenericOneOptionAlert(onViewController viewController: UIViewController, title: String? = nil, message: String, optionButtonText: String, optionHandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: optionButtonText.uppercased(),
                                      style: .default,
                                      handler: optionHandler))
        viewController.present(alert, animated: true, completion: nil)
    }
}
