//
//  GameViewController.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var questionView: UITextView!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    var gameSessionDelegate: GameSessionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    

    @IBAction func leaveGame(_ sender: Any) {
        Game.shared.terminateGameSession ()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func answerNumberOne(_ sender: Any) {
        answerIsGot(index: 0)
    }
    
    @IBAction func answerNumberTwo(_ sender: Any) {
        answerIsGot(index: 1)
    }
    
    @IBAction func answerNumberThree(_ sender: Any) {
        answerIsGot(index: 2)
    }
    
    @IBAction func answerNumberFour(_ sender: Any) {
        answerIsGot(index: 3)
    }
    
    private func answerIsGot ( index: Int ) {
        guard let gameSessionDelegate = gameSessionDelegate else { return }

        if ( !gameSessionDelegate.answer ( index: index )) {
            Game.shared.endGameSession()
            dismiss(animated: true, completion: nil)
        }
        if ( !gameSessionDelegate.nextQuestion()) {
            Game.shared.endGameSession()
            dismiss(animated: true, completion: nil)
        } else {
            configure()
        }
    }
    
    private func configure () {
        guard let gameSessionDelegate = gameSessionDelegate else { return }
        
        questionView.text = gameSessionDelegate.getCurrentQuestionTitle()
        answerOneButton.setTitle(gameSessionDelegate.getCurrentQuestionAnswerVariant(index: 0), for: .normal)
        answerTwoButton.setTitle(gameSessionDelegate.getCurrentQuestionAnswerVariant(index: 1), for: .normal)
        answerThreeButton.setTitle(gameSessionDelegate.getCurrentQuestionAnswerVariant(index: 2), for: .normal)
        answerFourButton.setTitle(gameSessionDelegate.getCurrentQuestionAnswerVariant(index: 3), for: .normal)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
