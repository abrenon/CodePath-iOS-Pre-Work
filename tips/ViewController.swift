//
//  ViewController.swift
//  tips
//
//  Created by Alexandria Brenon on 12/5/15.
//  Copyright © 2015 Alexandria Brenon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func billEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercent
        var total = billAmount+tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let def = defaults.integerForKey("default_tip")
        tipControl.selectedSegmentIndex = def
    }

    
}

