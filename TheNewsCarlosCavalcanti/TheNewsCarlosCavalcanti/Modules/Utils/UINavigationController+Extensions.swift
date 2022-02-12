//
//  UINavigationController+Extensions.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 12/02/22.
//

import UIKit

extension UINavigationController {
    private func setupAppearanceController(viewController controller: UIViewController) {
        self.navigationBar.prefersLargeTitles = false
        self.navigationBar.isTranslucent = false
    }
    
    func setupSunriseNavigationBar(controller: UIViewController, shouldRemoveBackItem: Bool = false) {
        self.navigationBar.setupAppearanceBar()
        self.setupAppearanceController(viewController: controller)
        guard shouldRemoveBackItem else { return }
        navigationItem.rightBarButtonItems?.removeAll()
    }
}
