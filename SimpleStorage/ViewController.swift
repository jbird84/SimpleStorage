//
//  ViewController.swift
//  SimpleStorage
//
//  Created by Kinney Kare on 12/5/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var coolLevelField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coolLevelLabel: UILabel!
    
    let storedName = UserDefaults.standard.object(forKey: "name")
    let storedCoolLevel = UserDefaults.standard.object(forKey: "coolLevel")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let storedName = UserDefaults.standard.object(forKey: "name")
        //        let storedCoolLevel = UserDefaults.standard.object(forKey: "coolLevel")
        
        if let theName = storedName as? String {
            if let theCoolLevel = storedCoolLevel as? String {
                nameLabel.text = theName
                coolLevelLabel.text = theCoolLevel
            }
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if let theName = nameField.text {
            if let theCoolLevel = coolLevelField.text {
                
                //Save to UserDefaults
                UserDefaults.standard.set(theName, forKey: "name")
                UserDefaults.standard.set(theCoolLevel, forKey: "coolLevel")
                
                //set the labels
                nameLabel.text = theName
                coolLevelLabel.text = theCoolLevel
            }
        }
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
        if storedName as? String != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        
        if storedCoolLevel as? String != nil {
            UserDefaults.standard.removeObject(forKey: "coolLevel")
            coolLevelLabel.text = "Cool Level:"
        }
    }
}

