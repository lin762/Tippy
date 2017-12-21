//
//  ViewController.swift
//  tippy
//
//  Created by Chris lin on 12/16/17.
//  Copyright © 2017 Chris lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let tip1 = String(defaults.integer(forKey: "def1")) + "%"
        let tip2 = String(defaults.integer(forKey: "def2")) + "%"
        let tip3 = String(defaults.integer(forKey: "def3")) + "%"
        tipSegmentedControl.setTitle(tip1, forSegmentAt: 0)
        tipSegmentedControl.setTitle(tip2, forSegmentAt: 1)
        tipSegmentedControl.setTitle(tip3, forSegmentAt: 2)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let tip1 = Double(defaults.integer(forKey: "def1"))/100.0
        let tip2 = Double(defaults.integer(forKey: "def2"))/100.0
        let tip3 = Double(defaults.integer(forKey: "def3"))/100.0

        let tipPercentages = [tip1,tip2,tip3]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
        
    }
    
}

