//
//  Guardian.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/9/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

struct Guardian {
    var name: String
    var membershipID: String
    var characters: [Player]
    
}
/// This is a Character
class Player {
    var characterID: String
    var light: Int?
    var type: String?
    var emblemPath: String = ""
    var emblem: UIImage?
    var basicStats: [[String:String]]?
    var weaponStats: [[String:String]]?
    var activitiesStats: [[String:String]]?
    var otherStats: [[String:String]]?
    
    init(char: (key: String, value: Any)) {
        self.characterID = char.key
        guard let charecterValues = char.value as? [String: Any] else {
            return
        }
        light = charecterValues["light"] as? Int ?? 0
        emblemPath = charecterValues["emblemBackgroundPath"] as? String ?? ""
        
        let classType = charecterValues["classType"] as? Int ?? 0
        switch classType {
        case 0:
            type = "Titan"
        case 1:
            type = "Hunter"
        default:
            type = "Warlock"
        }
    }
    
    func setStats(apiResponse: ApiResponse) {
        let allTime = apiResponse.Response.allPvP.allTime
        self.basicStats = allTime.basicStats()
        self.activitiesStats = allTime.activitiesStats()
        self.otherStats = allTime.otherStats()
        self.weaponStats = allTime.weaponStats()
        
    }
    
    func fetchEmblem(completion:@escaping()->()) {
        APIService.shared.getEmblem(with: self.emblemPath) { (fetchEmblem) in
            guard let fetchEmblem = fetchEmblem else {
                completion()
                return
            }
            self.emblem = fetchEmblem
            completion()
        }
    }
}
