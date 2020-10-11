//
//  SettingsViewController.swift
//  tip
//
//  Created by Aidan Lane on 10/9/20.
//  Copyright © 2020 Aidan Lane. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var setDefaultLabel: UILabel!
    @IBOutlet weak var themeControl: UISegmentedControl!
    @IBOutlet weak var DefaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        DefaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "tipControl")
        themeControl.selectedSegmentIndex = defaults.integer(forKey: "theme")
        
        updateTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTheme()
    }
    
    // Set Default Tip
    @IBAction func setDefaultTip(_ sender: Any) {
        defaults.set(DefaultTipControl.selectedSegmentIndex, forKey: "tipControl")
        defaults.synchronize()
    }
    
    // Changes Theme
    @IBAction func setTheme(_ sender: Any) {
        
        defaults.set(themeControl.selectedSegmentIndex, forKey: "theme")
        print(defaults.integer(forKey: "theme"))
        updateTheme()
        
    }
    
    func updateTheme(){
        if (defaults.integer(forKey: "theme") == 0){
            view.backgroundColor = .white
            themeLabel.textColor = .black
            setDefaultLabel.textColor = .black
        }
        else{
            view.backgroundColor = .darkGray
            themeLabel.textColor = .white
            setDefaultLabel.textColor = .white
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
