//
//  AppendQuestionViewController.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 06.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import UIKit

class AppendQuestionViewController: UIViewController {

    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answer2Field: UITextField!
    @IBOutlet weak var answer1Field: UITextField!
    @IBOutlet weak var answer3Field: UITextField!
    @IBOutlet weak var answer4Field: UITextField!
    @IBOutlet weak var answer1isRightSwitch: UISwitch!
    @IBOutlet weak var answer2isRightSwitch: UISwitch!
    @IBOutlet weak var answer3isRightSwitch: UISwitch!
    @IBOutlet weak var answer4isRightSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answer1isRightSwitch.setOn(true, animated: true)
        answer2isRightSwitch.setOn(false, animated: true)
        answer3isRightSwitch.setOn(false, animated: true)
        answer4isRightSwitch.setOn(false, animated: true)
    }
    
    @IBAction func leaveViewController(_ sender: Any) {
        dismiss (animated: true, completion: nil)
    }
    
    @IBAction func answer1isRightChanged(_ sender: Any) {
        if ( answer1isRightSwitch.isOn ) {
            setSwitchesOff ( exclude: 1 )
        }
    }
    
    @IBAction func answer2isRightChanged(_ sender: Any) {
        if ( answer2isRightSwitch.isOn ) {
            setSwitchesOff ( exclude: 2 )
        }
    }

    @IBAction func answer3isRightChanged(_ sender: Any) {
        if ( answer3isRightSwitch.isOn ) {
            setSwitchesOff ( exclude: 3 )
        }
    }
    
    @IBAction func answer4isRightChanged(_ sender: Any) {
        if ( answer4isRightSwitch.isOn ) {
            setSwitchesOff ( exclude: 4 )
        }
    }
    
    private func setSwitchesOff ( exclude: Int ) {
        if ( exclude != 1 ) {
            answer1isRightSwitch.setOn(false, animated: true)
        }
        if ( exclude != 2 ) {
            answer2isRightSwitch.setOn(false, animated: true)
        }
        if ( exclude != 3 ) {
            answer3isRightSwitch.setOn(false, animated: true)
        }
        if ( exclude != 4 ) {
            answer4isRightSwitch.setOn(false, animated: true)
        }
    }
    
    @IBAction func appendQuestion(_ sender: Any) {
        let question = questionField.text ?? ""
        let answer1 = answer1Field.text ?? ""
        let answer2 = answer2Field.text ?? ""
        let answer3 = answer3Field.text ?? ""
        let answer4 = answer4Field.text ?? ""
        
        var rightIndex = -1
        if ( answer1isRightSwitch.isOn ) {
            rightIndex = 0
        } else if ( answer2isRightSwitch.isOn ) {
            rightIndex = 1
        } else if ( answer3isRightSwitch.isOn ) {
            rightIndex = 2
        } else if ( answer4isRightSwitch.isOn ) {
            rightIndex = 3
        }
        
        if ( question.isEmpty || answer1.isEmpty || answer2.isEmpty || answer3.isEmpty || answer4.isEmpty || ( rightIndex == -1 )) {
            let alert = UIAlertController ( title: "Важно!", message: "Не соблюден формат вопроса!", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "Продолжить", style: .cancel, handler: nil))
            present(alert, animated: true)
        } else {
            Game.shared.appendNewQuestion(question: Question (question: question, answers: [answer1, answer2, answer3, answer4], rightAnswer: rightIndex))
            dismiss(animated: true, completion: nil)
        }
    }
}
