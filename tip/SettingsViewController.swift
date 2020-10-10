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
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    var isDark = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        if (defaults.integer(forKey: "theme") == 0){
            view.backgroundColor = .white
            themeLabel.textColor = .black
        }
        else{
            view.backgroundColor = .black
            themeLabel.textColor = .white
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (defaults.integer(forKey: "theme") == 0){
            view.backgroundColor = .white
            themeLabel.textColor = .black
        }
        else{
            view.backgroundColor = .black
            themeLabel.textColor = .white
        }
    }
    
    @IBAction func setThemeDefault(_ sender: UISegmentedControl){
        isDark = (sender.selectedSegmentIndex == 1)
        updateTheme()
        
        defaults.set(themeControl.selectedSegmentIndex, forKey: "theme")
        print(defaults.integer(forKey: "theme"))
        
        if (defaults.integer(forKey: "theme") == 0){
            view.backgroundColor = .white
            themeLabel.textColor = .black
        }
        else{
            view.backgroundColor = .black
            themeLabel.textColor = .white
        }
        
    }
    
    func updateTheme(){
        view.backgroundColor = isDark ? .black : .white
        //self.nameTextField.updateStyle(isDark: self.isDark)
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
