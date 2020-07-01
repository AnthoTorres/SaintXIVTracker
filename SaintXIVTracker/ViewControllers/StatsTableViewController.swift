//
//  StatsTableViewController.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/10/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

class StatsTableViewController: UITableViewController {
    
    @IBOutlet weak var characterSelected: UIImageView!
    @IBOutlet weak var classType: UILabel!
    @IBOutlet weak var lightLvl: UILabel!
    
    var character: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        character = selectedCharacter
        self.characterSelected.image = character?.emblem
        self.classType.text = character?.type
        self.lightLvl.text = "\(character?.light ?? 0)"
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return statsTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch statsTitles[section] {
        case .basic:
            return character?.basicStats?.count ?? 0
        case .weapon:
            return character?.weaponStats?.count ?? 0
        case .activities:
            return character?.activitiesStats?.count ?? 0
        case .other:
            return character?.otherStats?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return statsTitles[section].name
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor(red: 50/255, green: 22/255, blue: 47/255, alpha: 1.0)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guardianStats", for: indexPath)
        switch statsTitles[indexPath.section] {
        case .basic:
            guard let basicStats = character?.basicStats?[indexPath.row].first else { return cell }
            cell.textLabel?.text = basicStats.key
            cell.detailTextLabel?.text = basicStats.value
        case .weapon:
            guard let weaponStats = character?.weaponStats?[indexPath.row].first else { return cell }
            cell.textLabel?.text = weaponStats.key
            cell.detailTextLabel?.text = weaponStats.value
        case .activities:
            guard let activitiesStats = character?.activitiesStats?[indexPath.row].first else { return cell }
            cell.textLabel?.text = activitiesStats.key
            cell.detailTextLabel?.text = activitiesStats.value
        case .other:
            guard let otherStats = character?.otherStats?[indexPath.row].first else { return cell }
            cell.textLabel?.text = otherStats.key
            cell.detailTextLabel?.text = otherStats.value
        }
        return cell
    }
}
