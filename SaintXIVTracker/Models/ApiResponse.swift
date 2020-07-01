//
//  APIResponse.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/9/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import Foundation

struct ApiResponse: Decodable {
    var Response: Response
}

struct Response: Decodable {
    var allPvP: AllPvPDict
}

struct AllPvPDict: Decodable {
    var allTime: AllTimeDictionaries
}

struct AllTimeDictionaries: Decodable {
    
    var activitiesEntered: ActivitiesEnteredDict
    var activitiesWon: ActivitiesWonDict
    var assists: AssistsDictionary
    var kills: KillsDictionary
    var averageKillDistance: AverageKillDistanceDict
    var secondsPlayed: SecondsPlayedDict
    var deaths: DeathsDict
    var averageLifespan: AverageLifespanDict
    var bestSingleGameKills: BestSingleGameKillsDict
    var bestSingleGameScore: BestSingleGameScoreDict
    var opponentsDefeated: OpponentsDefeatedDict
    var efficiency: EfficiencyDict
    var killsDeathsRatio: KillsDeathsRatioDict
    var killsDeathsAssists: KillsDeathsAssistsDict
    var objectivesCompleted: ObjectivesCompletedDict
    var precisionKills: PrecisionKillsDict
    var resurrectionsPerformed: ResurrectionsPerformedDict
    var resurrectionsReceived: ResurrectionsReceivedDict
    var suicides: SuicidesDict
    var weaponKillsAutoRifle: WeaponKillsAutoRifleDict
    var weaponKillsBeamRifle: WeaponKillsBeamRifleDict
    var weaponKillsBow: WeaponKillsBowDict
    var weaponKillsFusionRifle: WeaponKillsFusionRifleDict
    var weaponKillsHandCannon: WeaponKillsHandCannonDict
    var weaponKillsTraceRifle: WeaponKillsTraceRifleDict
    var weaponKillsMachineGun: WeaponKillsMachineGunDict
    var weaponKillsPulseRifle: WeaponKillsPulseRifleDict
    var weaponKillsRocketLauncher: WeaponKillsRocketLauncherDict
    var weaponKillsScoutRifle: WeaponKillsScoutRifleDict
    var weaponKillsShotgun: WeaponKillsShotgunDict
    var weaponKillsSniper: WeaponKillsSniperDict
    var weaponKillsSubmachinegun: WeaponKillsSubmachinegunDict
    var weaponKillsRelic: WeaponKillsRelicDict
    var weaponKillsSideArm: WeaponKillsSideArmDict
    var weaponKillsSword: WeaponKillsSwordDict
    var weaponKillsGrenadeLauncher: WeaponKillsGrenadeLauncherDict
    var weaponKillsSuper: WeaponKillsSuperDict
    var weaponKillsMelee: WeaponKillsMeleeDict
    var weaponBestType: WeaponBestTypeDict
    var winLossRatio: WinLossRatioDict
    var longestKillSpree: LongestKillSpreeDict
    var longestSingleLife: LongestSingleLifeDict
    var mostPrecisionKills: MostPrecisionKillsDict
    var orbsDropped: OrbsDroppedDict
    var orbsGathered: OrbsGatheredDict
    var highestLightLevel: HighestLightLevelDict
    
    func otherStats() -> [[String: String]] {
        return [
            ["Average Kill Distance":averageKillDistance.basic.displayValue],
            ["Average Lifespan":averageLifespan.basic.displayValue],
            ["Best Single Game Kills":bestSingleGameKills.basic.displayValue],
            ["Best Single GameScore":bestSingleGameScore.basic.displayValue],
            ["Opponents Defeated":opponentsDefeated.basic.displayValue],
            ["Precision Kills":precisionKills.basic.displayValue],
            ["Resurrections Performed":resurrectionsPerformed.basic.displayValue],
            ["Resurrections Received":resurrectionsReceived.basic.displayValue],
            ["Suicides":suicides.basic.displayValue],
            ["Longest Kill Spree":longestKillSpree.basic.displayValue],
            ["Longest Single Life":longestSingleLife.basic.displayValue],
            ["Most Precision Kills":mostPrecisionKills.basic.displayValue],
            ["Orbs Dropped":orbsDropped.basic.displayValue],
            ["Orbs Gathered":orbsGathered.basic.displayValue],
            ["Current Light Level":highestLightLevel.basic.displayValue],
        ]
    }
    
    func basicStats() -> [[String: String]] {
        return [
            ["Kills":kills.basic.displayValue],
            ["Deaths":deaths.basic.displayValue],
            ["Efficiency":efficiency.basic.displayValue],
            ["K/D":killsDeathsRatio.basic.displayValue],
            ["Assists":assists.basic.displayValue],
            ["KD/A":killsDeathsAssists.basic.displayValue],
            ["Best Weapon":weaponBestType.basic.displayValue],
        ]
    }
    
    func activitiesStats() -> [[String: String]] {
        return [
            ["Activities Entered":activitiesEntered.basic.displayValue],
            ["Activities Won":activitiesWon.basic.displayValue],
            ["Objectives Completed":objectivesCompleted.basic.displayValue],
            ["Win Ratio":winLossRatio.basic.displayValue],
            ["Time Played":secondsPlayed.basic.displayValue],
        ]
    }
    
    func weaponStats() -> [[String: String]] {
        return [
            ["HandCannon Kills":weaponKillsHandCannon.basic.displayValue],
            ["AutoRifle Kills":weaponKillsAutoRifle.basic.displayValue],
            ["Bow Kills":weaponKillsBow.basic.displayValue],
            ["Sniper Kills":weaponKillsSniper.basic.displayValue],
            ["PulseRifle Kills":weaponKillsPulseRifle.basic.displayValue],
            ["ScoutRifle Kills":weaponKillsScoutRifle.basic.displayValue],
            ["FusionRifle Kills":weaponKillsFusionRifle.basic.displayValue],
            ["Shotgun Kills":weaponKillsShotgun.basic.displayValue],
            ["Submachinegun Kills":weaponKillsSubmachinegun.basic.displayValue],
            ["RocketLauncher Kills":weaponKillsRocketLauncher.basic.displayValue],
            ["MachineGun Kills":weaponKillsMachineGun.basic.displayValue],
            ["SideArm Kills":weaponKillsSideArm.basic.displayValue],
            ["TraceRifle Kills":weaponKillsTraceRifle.basic.displayValue],
            ["BeamRifle Kills":weaponKillsBeamRifle.basic.displayValue],
            ["Sword Kills":weaponKillsSword.basic.displayValue],
            ["GrenadeLauncher Kills":weaponKillsGrenadeLauncher.basic.displayValue],
            ["Super Kills":weaponKillsSuper.basic.displayValue],
            ["Melee Kills":weaponKillsMelee.basic.displayValue],
            ["Relic Kills":weaponKillsRelic.basic.displayValue],
        ]
    }
    
}

struct ActivitiesEnteredDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct ActivitiesWonDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct AssistsDictionary: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct KillsDictionary: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct AverageKillDistanceDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct SecondsPlayedDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct DeathsDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct AverageLifespanDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct BestSingleGameKillsDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct OpponentsDefeatedDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct EfficiencyDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct KillsDeathsRatioDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct KillsDeathsAssistsDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct ObjectivesCompletedDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct PrecisionKillsDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct ResurrectionsPerformedDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct ResurrectionsReceivedDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct SuicidesDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsAutoRifleDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsBeamRifleDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsBowDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsFusionRifleDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsHandCannonDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsTraceRifleDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsMachineGunDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsPulseRifleDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsRocketLauncherDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsScoutRifleDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsShotgunDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsSniperDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsSubmachinegunDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsRelicDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsSideArmDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsSwordDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsGrenadeLauncherDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsSuperDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponKillsMeleeDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WeaponBestTypeDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct WinLossRatioDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct LongestKillSpreeDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct LongestSingleLifeDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct MostPrecisionKillsDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct OrbsDroppedDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct OrbsGatheredDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct HighestLightLevelDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}

struct BestSingleGameScoreDict: Decodable {
    var basic: BasicDictionary
    struct BasicDictionary: Decodable {
        var displayValue: String
    }
}
