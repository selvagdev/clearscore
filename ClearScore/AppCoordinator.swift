//
//  AppCoordinator.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//

import UIKit

final class AppCoordinator {

    private let window: UIWindow
    private let navigation: UINavigationController
    var creditReportNetwork = CreditReportNetwork() // make the call
    
    init(window: UIWindow, navigation: UINavigationController) {
        self.window = window
        self.navigation = navigation
        window.configure(with: navigation)
        navigation.configure()
    }

    convenience init() {
        self.init(window: UIWindow(), navigation: UINavigationController())
    }

    //Initial launch view controller
    func start() {
        let score = ScoreViewController()
        score.delegate = self
        navigation.pushViewController(score, animated: true)
    }
}

extension AppCoordinator : ScoreViewControllerDelegate {
    
    // load data from network
    func didPressLoadData(completion: @escaping Response) {
        creditReportNetwork.performRequest { (value, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            guard let value = value else {
                completion(nil, error)
                return
            }
            completion(value, nil)
        }
    }
    
    // refresh data
    func didPressRefreshData(completion: @escaping Response) {
        didPressLoadData { (value, error) in
            completion(value, error)
        }
    }
}
