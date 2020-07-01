//
//  Platform.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/9/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

enum Platform: String {
    
    case playstation = "PS"
    case xbox = "XB"
    case steam = "SM"
    
    var name: String {
        return self.rawValue
    }
    
    var system: UIImage {
        switch self {
        case .playstation:
            return #imageLiteral(resourceName: "Playstation logo")
        case .xbox:
            return #imageLiteral(resourceName: "Xbox logo")
        case .steam:
            return #imageLiteral(resourceName: "Steam logo")
        }
    }
    
    var color: UIColor {
        switch self {
        case .playstation:
            return .blue
        case .xbox:
            return .green
        case .steam:
            return .gray
        }
    }
    
    var type: Int {
        switch self {
        case .playstation:
            return 2
        case .xbox:
            return 1
        case .steam:
            return 3
        }
    }
}
