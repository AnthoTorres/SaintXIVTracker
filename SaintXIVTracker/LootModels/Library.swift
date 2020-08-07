//
//  Library.swift
//  SaintXIVTracker
//
//  Created by Anthony Torres on 7/7/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

// All Strikes
let allStrikes: [Strike] = [invertedSpire,pyramidion,exodusCrash,theArmsDealer,savathûnsSong,treeOfProbabilities,aGardenWorld,willOfTheThousands,strangeTerrain,lakeOfShadows,theInsightTerminus,theCorrupted,theHollowedLair,wardenOfNothing]

// Inverted Spire
let invertedSpire: Strike = Strike(descripition: "“End the Red Legion expedition that’s ripped open the planet’s surface.”", name: "The Inverted Spire", strikeImage: UIImage(contentsOfFile: "StrikeInvertedSpire")!, strikeCellImage: UIImage(contentsOfFile: "StrikeInvertedSpire")!, emblem: [invertedEmb1,invertedEmb2,invertedEmb3,invertedEmb4])

var invertedEmb1 = UIImage(contentsOfFile: "InvertedSpire1")
var invertedEmb2 = UIImage(contentsOfFile: "InvertedSpire2")
var invertedEmb3 = UIImage(contentsOfFile: "InvertedSpire3")
var invertedEmb4 = UIImage(contentsOfFile: "InvertedSpire4")

// Pyramidion
let pyramidion: Strike = Strike(descripition: "“Seek vengeance against the Vex Mind that corrupted Asher’s arm.”", name: "Pyramidion", strikeImage: UIImage(contentsOfFile: "StrikeThePyramdion")!, strikeCellImage: UIImage(contentsOfFile: "StrikeThePyramdion")!, emblem: [pyramidionEmb1,pyramidionEmb2,pyramidionEmb3,pyramidionEmb4])

var pyramidionEmb1 = UIImage(contentsOfFile: "Pyramidion1")
var pyramidionEmb2 = UIImage(contentsOfFile: "Pyramidion2")
var pyramidionEmb3 = UIImage(contentsOfFile: "Pyramidion3")
var pyramidionEmb4 = UIImage(contentsOfFile: "Pyramidion4")

// Exodus Crash
let exodusCrash: Strike = Strike(descripition: "“Purge the Fallen infestation of the Exodus Black.”", name: "Exodus Crash", strikeImage: UIImage(contentsOfFile: "StrikeExodusCrash")!, strikeCellImage: UIImage(contentsOfFile: "StrikeExodusCrash")!, emblem: [exodusCrashEmb1,exodusCrashEmb2,exodusCrashEmb3,exodusCrashEmb4])

var exodusCrashEmb1 = UIImage(contentsOfFile: "ExodusCrash1")
var exodusCrashEmb2 = UIImage(contentsOfFile: "ExodusCrash2")
var exodusCrashEmb3 = UIImage(contentsOfFile: "ExodusCrash3")
var exodusCrashEmb4 = UIImage(contentsOfFile: "ExodusCrash4")

// The Arms Dealer
let theArmsDealer: Strike = Strike(descripition: "“Shut down the operations of an ironmonger providing weapons to the Red Legion.”", name: "The Arms Dealer", strikeImage: UIImage(contentsOfFile: "StrikeTheArmsDealer")!, strikeCellImage: UIImage(contentsOfFile: "StrikeTheArmsDealer")!, emblem: [theArmsDealerEmb1,theArmsDealerEmb2,theArmsDealerEmb3,theArmsDealerEmb4])

var theArmsDealerEmb1 = UIImage(contentsOfFile: "TheArmsDealer1")
var theArmsDealerEmb2 = UIImage(contentsOfFile: "TheArmsDealer2")
var theArmsDealerEmb3 = UIImage(contentsOfFile: "TheArmsDealer3")
var theArmsDealerEmb4 = UIImage(contentsOfFile: "TheArmsDealer4")

// Savathûn's Song
let savathûnsSong: Strike = Strike(descripition: "“Delve deep into the Hive-infested Arcology in search of missing fireteams.”", name: "Savathûn's Song", strikeImage: UIImage(contentsOfFile: "StrikeSavanthunsSong")!, strikeCellImage: UIImage(contentsOfFile: "StrikeSavanthunsSong")!, emblem: [savathûnsSongEmb1,savathûnsSongEmb2,savathûnsSongEmb3,savathûnsSongEmb4])

var savathûnsSongEmb1 = UIImage(contentsOfFile: "Savathûn'sSong1")
var savathûnsSongEmb2 = UIImage(contentsOfFile: "Savathûn'sSong2")
var savathûnsSongEmb3 = UIImage(contentsOfFile: "Savathûn'sSong3")
var savathûnsSongEmb4 = UIImage(contentsOfFile: "Savathûn'sSong4")

// Tree Of Probabilities
let treeOfProbabilities: Strike = Strike(descripition: "“Contain a rampant army of Red Legion within the Infinite Forest.”", name: "Tree Of Probabilities", strikeImage: UIImage(contentsOfFile: "StrikeTreeOfProbabilities")!, strikeCellImage: UIImage(contentsOfFile: "StrikeTreeOfProbabilities")!, emblem: [treeOfProbabilitiesEmb1,treeOfProbabilitiesEmb2,treeOfProbabilitiesEmb3,treeOfProbabilitiesEmb4])

var treeOfProbabilitiesEmb1 = UIImage(contentsOfFile: "TreeOfProbabilities1")
var treeOfProbabilitiesEmb2 = UIImage(contentsOfFile: "TreeOfProbabilities2")
var treeOfProbabilitiesEmb3 = UIImage(contentsOfFile: "TreeOfProbabilities3")
var treeOfProbabilitiesEmb4 = UIImage(contentsOfFile: "TreeOfProbabilities4")

// A Garden World
let aGardenWorld: Strike = Strike(descripition: "“Help Osiris cut back an out-of-control Vex Mind.”", name: "A Garden World", strikeImage: UIImage(contentsOfFile: "StrikeAGardenWorld")!, strikeCellImage: UIImage(contentsOfFile: "StrikeAGardenWorld")!, emblem: [aGardenWorldEmb1,aGardenWorldEmb2,aGardenWorldEmb3,aGardenWorldEmb4,aGardenWorldEmb5])

var aGardenWorldEmb1 = UIImage(contentsOfFile: "AGardenWorld1")
var aGardenWorldEmb2 = UIImage(contentsOfFile: "AGardenWorld2")
var aGardenWorldEmb3 = UIImage(contentsOfFile: "AGardenWorld3")
var aGardenWorldEmb4 = UIImage(contentsOfFile: "AGardenWorld4")
var aGardenWorldEmb5 = UIImage(contentsOfFile: "AGardenWorld5")

// Will of the Thousands
let willOfTheThousands: Strike = Strike(descripition: "“Defeat Xol before everything is destroyed.”", name: "Will of the Thousands", strikeImage: UIImage(contentsOfFile: "StrikeWillOfTheThousands")!, strikeCellImage: UIImage(contentsOfFile: "StrikeWillOfTheThousands")!, emblem: [willOfTheThousandsEmb1,willOfTheThousandsEmb2,willOfTheThousandsEmb3,willOfTheThousandsEmb4])

var willOfTheThousandsEmb1 = UIImage(contentsOfFile: "WillOfTheThousands1")
var willOfTheThousandsEmb2 = UIImage(contentsOfFile: "WillOfTheThousands2")
var willOfTheThousandsEmb3 = UIImage(contentsOfFile: "WillOfTheThousands3")
var willOfTheThousandsEmb4 = UIImage(contentsOfFile: "WillOfTheThousands4")

// Strange Terrain
let strangeTerrain: Strike = Strike(descripition: "“Defeat Nokris before he completes his ritual.”", name: "Strange Terrain", strikeImage: UIImage(contentsOfFile: "StrikeStrangeTerrain")!, strikeCellImage: UIImage(contentsOfFile: "StrikeStrangeTerrain")!, emblem: [strangeTerrainEmb1,strangeTerrainEmb2,strangeTerrainEmb3,strangeTerrainEmb4])

var strangeTerrainEmb1 = UIImage(contentsOfFile: "StrangeTerrain1")
var strangeTerrainEmb2 = UIImage(contentsOfFile: "StrangeTerrain2")
var strangeTerrainEmb3 = UIImage(contentsOfFile: "StrangeTerrain3")
var strangeTerrainEmb4 = UIImage(contentsOfFile: "StrangeTerrain4")

// Lake of Shadows
let lakeOfShadows: Strike = Strike(descripition: "“Stem the tide of Taken flowing into the European Dead Zone from beneath the waves.”", name: "Lake of Shadows", strikeImage: UIImage(contentsOfFile: "StrikeLakeOfShadows")!, strikeCellImage: UIImage(contentsOfFile: "StrikeLakeOfShadows")!, emblem: [lakeOfShadowsEmb1,lakeOfShadowsEmb2])

var lakeOfShadowsEmb1 = UIImage(contentsOfFile: "LakeOfShadows1")
var lakeOfShadowsEmb2 = UIImage(contentsOfFile: "LakeOfShadows2")

// The Insight Terminus
let theInsightTerminus: Strike = Strike(descripition: "“Break into the ancient Vex installation.”", name: "The Insight Terminus", strikeImage: UIImage(contentsOfFile: "StrikeTheInsightTerminus")!, strikeCellImage: UIImage(contentsOfFile: "StrikeTheInsightTerminus")!, emblem: [theInsightTerminusEmb1,theInsightTerminusEmb2])

var theInsightTerminusEmb1 = UIImage(contentsOfFile: "TheInsightTerminus1")
var theInsightTerminusEmb2 = UIImage(contentsOfFile: "TheInsightTerminus2")

// The Corrupted
let theCorrupted: Strike = Strike(descripition: "“Hunt down one of Queen Mara’s most trusted advisors and free her from Taken possession.”", name: "The Corrupted", strikeImage: UIImage(contentsOfFile: "StrikeTheCorrupted")!, strikeCellImage: UIImage(contentsOfFile: "StrikeTheCorrupted")!, emblem: [theCorruptedEmb1,theCorruptedEmb2])

var theCorruptedEmb1 = UIImage(contentsOfFile: "TheCorrupted1")
var theCorruptedEmb2 = UIImage(contentsOfFile: "TheCorrupted2")

// The Hollowed Lair
let theHollowedLair: Strike = Strike(descripition: "“The Fanatic has returned. Take him down and finish the job you started.”", name: "The Hollowed Lair", strikeImage: UIImage(contentsOfFile: "StrikeTheHollowedLair")!, strikeCellImage: UIImage(contentsOfFile: "StrikeTheHollowedLair")!, emblem: [])

var theHollowedLairEmb1 = UIImage(contentsOfFile: "TheHollowedLair1")
var theHollowedLairEmb2 = UIImage(contentsOfFile: "TheHollowedLair12")

// Warden of Nothing
let wardenOfNothing: Strike = Strike(descripition: "“Help the Drifter restore order at the Prison of Elders.”", name: "Warden of Nothing", strikeImage: UIImage(contentsOfFile: "StrikeWardenOfNothing")!, strikeCellImage: UIImage(contentsOfFile: "StrikeWardenOfNothing")!, emblem: [wardenOfNothingEmb1,wardenOfNothingEmb2])

var wardenOfNothingEmb1 = UIImage(contentsOfFile: "WardenOfNothing1")
var wardenOfNothingEmb2 = UIImage(contentsOfFile: "WardenOfNothing2")
