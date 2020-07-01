//
//  Stats.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/9/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import Foundation

enum Stat: String {
    case other = "Other Stats"
    case weapon = "Weapon Stats"
    case activities = "Activities Stats"
    case basic = "Basic Stats"
    
    var name: String {
        switch self {
        case .other:
            return "Other Stats"
        case .weapon:
            return "Weapon Stats"
        case .activities:
            return "Activities Stats"
        case .basic:
            return "Basic Stats"
        }
    }
}

var statsTitles: [Stat] = [.basic, .weapon, .activities, .other]
