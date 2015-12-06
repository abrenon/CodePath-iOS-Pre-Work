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
    @IBOutlet weak var onePersonLabel: UILabel!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func billEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        let tip = billAmount * tipPercent
        let total = billAmount+tip
        let half = total/2
        let third = total/3
        let quarter = total/4
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        onePersonLabel.text = String(format: "$%.2f", half)
        twoPersonLabel.text = String(format: "$%.2f", third)
        threePersonLabel.text = String(format: "$%.2f", quarter)
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let def = defaults.integerForKey("default_tip")
        tipControl.selectedSegmentIndex = def
        billEditingChanged("0")
        self.billField.becomeFirstResponder()
    }

    
}

