//
//  Utility.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/10/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    // Shared Instance
    static let shared = Utility()
    
    enum ViewController {
        case guardian
        case stats
        
        var id: String {
            switch self {
            case .guardian:
                return "GuardianVC"
            case .stats:
                return "StatsVC"
            }
        }
    }
    
    func presentTableViewController(vc: ViewController, viewController: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch vc {
        case .guardian:
            guard let gVC = storyboard.instantiateViewController(withIdentifier: vc.id) as? GuardianTableViewController else { return }
            viewController.navigationController?.pushViewController(gVC, animated: true)
        case .stats:
            guard let sVC = storyboard.instantiateViewController(identifier: vc.id) as? StatsTableViewController else { return }
            viewController.navigationController?.pushViewController(sVC, animated: true)
        }
    }
}
var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.color = .white
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
