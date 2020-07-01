//
//  TrackerTableViewController.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/9/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

class TrackerTableViewController: UITableViewController, UISearchTextFieldDelegate {
    
    @IBOutlet weak var platformButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.delegate = self
        self.searchBar.barTintColor = UIColor(red: 61/255, green: 62/255, blue: 70/255, alpha: 1.0)
        self.setupToHideKeyboardOnTapOnView()
        setupPlatform()
        setupViews()
    }
    
    @IBAction func changePlatform(_ sender: Any) {
        switch currentPlatform {
        case .playstation:
            currentPlatform = .xbox
        case .xbox:
            currentPlatform = .steam
        case .steam:
            currentPlatform = .playstation
        }
        setupPlatform()
    }
    
    func setupPlatform() {
        platformButton.image = currentPlatform.system
        platformButton.tintColor = currentPlatform.color
    }
    
    func setupViews() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "XIVBackground")
        backgroundImage.contentMode = .scaleAspectFit
        view.insertSubview(backgroundImage, at: 0)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        DispatchQueue.main.async {
            self.searchGuardian()
            self.dismissKeyboard()
        }
        return true
    }
    
    func searchGuardian() {
        self.showSpinner(onView: self.view)
        guard let guardian = self.searchBar.searchTextField.text else { return }
        APIService.shared.getMemberID(by: guardian, and: currentPlatform.type) { (ID) in
            DispatchQueue.main.async {
                guard let ID = ID else {
                    return self.removeSpinner()
                }
                APIService.shared.getCharacters(by: ID, and: currentPlatform.type) { (chars)  in
                    DispatchQueue.main.async {
                        guard let chars = chars else { return }
                        var idArray: [Player] = []
                        for char in chars {
                            idArray.append(Player(char: char))
                        }
                        currentGuardian = Guardian(name: guardian, membershipID: ID, characters: idArray)
                        self.removeSpinner()
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "guardian", for: indexPath)
        
        if currentGuardian != nil {
            cell.textLabel?.text = currentGuardian?.name
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "None", for: indexPath)
            cell.textLabel?.text = "No Results"
            cell.selectionStyle = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if currentGuardian != nil {
            Utility.shared.presentTableViewController(vc: .guardian, viewController: self)
        } else {
            return
        }
    }
}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap) }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
