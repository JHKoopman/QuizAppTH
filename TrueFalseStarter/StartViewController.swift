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
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var mathButton: UIButton!
    @IBOutlet weak var lightningSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
