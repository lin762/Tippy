//
//  SettingsViewController.swift
//  tippy
//
//  Created by Chris lin on 12/17/17.
//  Copyright © 2017 Chris lin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var default1: UITextField!
    @IBOutlet weak var default2: UITextField!
    @IBOutlet weak var default3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        default1.text = defaults.string(forKey: "def1")
        default2.text = defaults.string(forKey: "def2")
        default3.text = defaults.string(forKey: "def3")
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(Int(default1.text!), forKey: "def1")
        defaults.set(Int(default2.text!), forKey: "def2")
        defaults.set(Int(default3.text!), forKey: "def3")
        defaults.synchronize()
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
