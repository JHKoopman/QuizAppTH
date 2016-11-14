//
//  StartViewController.swift
//  TrueFalseStarter
//
//  Created by Jari Koopman on 14/11/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var mathButton: UIButton!
    @IBOutlet weak var lightningSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = nil
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sportsPressed(sender: AnyObject) {
        buttonPressed(sportsButton, lightning: lightningSwitch.state)
    }
    @IBAction func generalPressed(sender: AnyObject) {
        buttonPressed(generalButton, lightning: lightningSwitch.state)
    }
    @IBAction func mathsPressed(sender: AnyObject) {
        buttonPressed(mathButton, lightning: lightningSwitch.state)
    }
    
    
    
    
    
    func buttonPressed(sender: UIButton, lightning: UIControlState) {
        if sender == sportsButton {
            let category = "Sports"
            var lightning: Bool{
                if lightningSwitch.on == true {
                    return true
                } else {
                    return false
                }
            }
            let data: [String:AnyObject] = ["Category":category, "Lightning": lightning]
            performSegueWithIdentifier("openQuestion", sender: data)
        } else if sender == generalButton {
            let category = "General"
            var lightning: Bool{
                if lightningSwitch.on == true {
                    return true
                } else {
                    return false
                }
            }
            let data: [String:AnyObject] = ["Category":category, "Lightning": lightning]
            performSegueWithIdentifier("openQuestion", sender: data)
        } else if sender == mathButton {
            let category = "Math"
            var lightning: Bool{
                if lightningSwitch.on == true {
                    return true
                } else {
                    return false
                }
            }
            let data: [String:AnyObject] = ["Category":category, "Lightning": lightning]
            performSegueWithIdentifier("openQuestion", sender: data)
        } else {
            print("Something's wrong")
        }
        
    }
    

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openQuestion" {
            if let questionVC = segue.destinationViewController as? ViewController {
                questionVC.categoryData = sender as! [String:AnyObject]
            }
        }
    }

}
