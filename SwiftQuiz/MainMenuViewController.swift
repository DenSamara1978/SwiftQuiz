//
//  MainMenuViewController.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "NewGameSegue" ) {
            Game.shared.beginGameSession ()
            let dstVC = segue.destination as! GameViewController
            dstVC.gameSessionDelegate = Game.shared.gameSession
        }
    }
}
