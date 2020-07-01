//
//  GuardianTableViewController.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/10/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

class GuardianTableViewController: UITableViewController {
    
    var characterDataLoaded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        self.navigationController?.title = currentGuardian?.name
        DispatchQueue.main.async {
            self.loadCharacterData()
        }
    }
    
    func loadCharacterData() {
        self.showSpinner(onView: self.view)
        let group1 = DispatchGroup()
        guard let tempGuardian = currentGuardian else {
            return
        }
        
        var characterArray: [Player] = []
        tempGuardian.characters.forEach { (character) in
            group1.enter()
            APIService.shared.getPlayerAllTimeCrucibleStats(memberID: tempGuardian.membershipID, membershipType: currentPlatform.type, characterID: character.characterID) { (response) in
                guard let response = response else {
                    group1.leave()
                    return
                }
                let tempCharacter = character
                tempCharacter.setStats(apiResponse: response)
                characterArray.append(tempCharacter)
                group1.leave()
            }
        }
        group1.notify(queue: .main) {
            currentGuardian?.characters = characterArray
            self.loadEmblems()
            self.characterDataLoaded = true
        }
    }
    
    func loadEmblems() {
        let group1 = DispatchGroup()
        currentGuardian?.characters.forEach { (char) in
            group1.enter()
            char.fetchEmblem {
                group1.leave()
            }
        }
        group1.wait()
        self.removeSpinner()
        self.tableView.reloadData()
    }
    
    func setupViews() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "XIVBackground")
        backgroundImage.contentMode = .scaleAspectFit
        tableView.backgroundView = backgroundImage
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGuardian?.characters.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characters", for: indexPath)
        let character = currentGuardian?.characters[indexPath.row]
        cell.textLabel?.text = character?.type
        
        DispatchQueue.main.async {
            let imageView = UIImageView(frame: CGRect(x: 1, y: 1, width: cell.frame.width, height: cell.frame.height))
            imageView.image = character?.emblem
            cell.backgroundView = UIView()
            cell.backgroundView?.addSubview(imageView)
            self.tableView.reloadData()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if characterDataLoaded {
            selectedCharacter = currentGuardian?.characters[indexPath.row]
            Utility.shared.presentTableViewController(vc: .stats, viewController: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let currentImage = currentGuardian?.characters[indexPath.row].emblem else { return 43 }
        let imageRatio = currentImage.getImageRatio()
        return tableView.frame.width / imageRatio
    }
}

extension UIImage {
    func getImageRatio() -> CGFloat {
        let imageRatio = CGFloat(self.size.width / self.size.height)
        return imageRatio
    }
}
