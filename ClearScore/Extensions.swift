//
//  Extensions.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//

import UIKit

//default color scheme
extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static func semirgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 0.5)
    }
}


// MARK: - UIWindow Extension
extension UIWindow {
    func configure(with navigation: UINavigationController) {
        makeKeyAndVisible()
        rootViewController = navigation
    }
}

// MARK: - UINavigationController Extension
extension UINavigationController {
    func configure() {
        navigationBar.isHidden = false
        interactivePopGestureRecognizer?.isEnabled = false
    }
}

// MARK:- UIViewcontroller extension
extension UIViewController {
    
    // MARK: Alerts
    func showAlertWith(message: AlertMessage , style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

