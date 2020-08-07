//
//  Nightfall.swift
//  SaintXIVTracker
//
//  Created by Anthony Torres on 7/2/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

class Nightfall: Strike {
    
    var nightfallSpecificItem: [NightfallSpecificItem]
    
    init(nightfallSpecificItem: [NightfallSpecificItem], strike: Strike) {
        self.nightfallSpecificItem = nightfallSpecificItem
        super.init(descripition: strike.descripition, name: strike.name, strikeImage: strike.strikeImage, strikeCellImage: strike.strikeCellImage)
    }
}
