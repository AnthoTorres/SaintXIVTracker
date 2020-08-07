//
//  Strike.swift
//  SaintXIVTracker
//
//  Created by Anthony Torres on 7/2/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

class Strike {
    var descripition: String
    var name: String
    var strikeImage: UIImage
    var strikeCellImage: UIImage
    var emblem: [UIImage?] = []
    //var specificItemName: String
    //var SpecificItemImage: UIImage
    
    init(descripition: String, name: String, strikeImage: UIImage, strikeCellImage: UIImage, emblem: [UIImage?] = []) {
        self.descripition = descripition
        self.name = name
        self.strikeImage = strikeImage
        self.strikeCellImage = strikeCellImage
        self.emblem = emblem
    }
}
