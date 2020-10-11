//
//  ViewController.swift
//  tip
//
//  Created by Aidan Lane on 8/21/20.
//  Copyright © 2020 Aidan Lane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipControl")
        
        // Keyboard automatically shows
        billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipControl")
    }
    
    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        // Calculate the tip and total
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex])
        let total = (bill + tip)
        
        let locale = Locale.current
        let curSymbol = locale.currencySymbol!
        
        // Update the tip and total labels
        tipPercentageLabel.text = String(format: curSymbol + "%.2f", tip)
        totalLabel.text = String(format: curSymbol + "%.2f", total)
    }
    
}

