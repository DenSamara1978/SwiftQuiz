//
//  GameScene.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

protocol GameSessionDelegate {
    func answer ( index: Int ) -> Bool
    func nextQuestion () -> Bool
    func getCurrentQuestionTitle () -> String?
    func getCurrentQuestionAnswerVariant ( index: Int ) -> String?
}

class GameSession {
    private let questionPool = QuestionPool ()
    private var currentQuestionIndex = 0
    
    private var rightAnswered = 0
    private var totalAsked = 0
    
    private var question: Question? {
        if ( currentQuestionIndex >= questionPool.count ) {
            return nil
        } else {
            return questionPool.getQuestion(number: currentQuestionIndex)
        }
    }
    
    func getResult () -> ( Int, Int ) {
        return ( totalAsked, rightAnswered )
    }
}

extension GameSession: GameSessionDelegate {
    func nextQuestion () -> Bool {
        currentQuestionIndex += 1
        guard let _ = question else { return false }
        return true
    }
    
    func getCurrentQuestionTitle () -> String? {
        return question?.question
    }
    
    func getCurrentQuestionAnswerVariant ( index: Int ) -> String? {
        guard let question = question else { return nil }
        if (( index >= 0 ) && ( index < question.answers.count )) {
            return question.answers [index]
        } else {
            return nil
        }
    }
    
    func answer ( index: Int ) -> Bool {
        guard let question = question else { return false }
        totalAsked += 1
        if ( question.rightAnswer == index ) {
            rightAnswered += 1
            return true
        } else {
            return false
        }
    }
}
