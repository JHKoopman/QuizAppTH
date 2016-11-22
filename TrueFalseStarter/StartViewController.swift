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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = nil
    }
    
    @IBAction func sportsPressed(sender: AnyObject) {
        buttonPressed(sportsButton)
    }
    @IBAction func generalPressed(sender: AnyObject) {
        buttonPressed(generalButton)
    }
    //Check what button is pressed and if lightning mode is activated
    //Than send that information to the destination VC
    func buttonPressed(sender: UIButton) {
        if sender == sportsButton {
            let category = "Sports"
            let data: String = category
            performSegueWithIdentifier("openQuestion", sender: data)
        } else if sender == generalButton {
            let category = "General"
            let data: String = category
            performSegueWithIdentifier("openQuestion", sender: data)
        } else {
            print("Something's wrong")
        }
        
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openQuestion" {
            if let questionVC = segue.destinationViewController as? ViewController {
                questionVC.categoryData = sender as! String
            }
        }
    }

}
