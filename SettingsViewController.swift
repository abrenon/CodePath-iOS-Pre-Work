//
//  SettingsViewController.swift
//  tips
//
//  Created by Alexandria Brenon on 12/5/15.
//  Copyright © 2015 Alexandria Brenon. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeDefault(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultControl.selectedSegmentIndex, forKey: "default_tip")
        defaults.synchronize()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let def = defaults.integerForKey("default_tip")
        defaultControl.selectedSegmentIndex = def
        
    }

}
