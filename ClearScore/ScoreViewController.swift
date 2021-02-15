//
//  ScoreViewController.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//

import UIKit

protocol ScoreViewControllerDelegate : AnyObject {
    func didPressRefreshData(completion: @escaping Response)  // if refresh neededs
    func didPressLoadData(completion: @escaping Response) // load data from network
}

final class ScoreViewController: UIViewController {

    weak var delegate: ScoreViewControllerDelegate? //score delegate
    let scoreView = ScoreView() // score view
        
    // MARK: - Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.title = "Dashboard"
        
        self.addScoreView()
        self.loadData()
    }
    
    // MARK: - private methods
    
    // add score View to main view
    func addScoreView() {
        self.view.addSubview(scoreView)
        scoreView.center = self.view.center
    }
    
    // load score View to the screen
    func loadData() {
        delegate?.didPressLoadData(completion: { (value, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    self.showAlertWith(message: AlertMessage(title: "Error \(error!._code)", body: error!.localizedDescription), style: .alert)
                }
                return
            }
            
            //update score on the label
            self.scoreView.update(score: CGFloat((value?.creditReportInfo!.score!)!))
        })
    }
    
    //TODO: add refresh button to the screen, if refresh needed
}
