//
//  SettingsViewController.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 06.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var questionModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionModeSwitch.setOn(Game.shared.questionMode == .random, animated: true)
    }
    
    @IBAction func leaveSettings(_ sender: Any) {
        dismiss (animated: true, completion: nil)
    }
    
    @IBAction func modeSwitched(_ sender: Any) {
        Game.shared.questionMode = questionModeSwitch.isOn ? .random : .serial
    }
}
