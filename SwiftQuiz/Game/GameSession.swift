//
//  GameScene.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation


enum QuestionMode {
    case serial
    case random
}

protocol GameSessionDelegate {
    func answer ( index: Int ) -> Bool
    func nextQuestion () -> Bool
    func getCurrentQuestionTitle () -> String?
    func getCurrentQuestionAnswerVariant ( index: Int ) -> String?
}

class GameSession {
    private var questionManager: QuestionManager?
    private var currentQuestionIndex = 0
    private var question: Question?

    private(set) var questionNumber: Observable<Int>
    private(set) var currentResult: Observable<Float>
    private var totalQuestionCount = 0
    
    public init ( mode: QuestionMode ) {
        if ( mode == .random ) {
            questionManager = RandomQuestionManager ()
        } else {
            questionManager = SerialQuestionManager ()
        }
        questionNumber = Observable ( 0 )
        currentResult = Observable ( 0.0 )
        totalQuestionCount = questionManager?.getQuestionCount () ?? 1
    }

    func getCurrentResult () -> Float {
        return currentResult.value
    }
}

extension GameSession: GameSessionDelegate {
    func nextQuestion () -> Bool {
        question = questionManager?.nextQuestion()
        return ( question != nil )
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
        if ( question.rightAnswer == index ) {
            questionNumber.value += 1
            currentResult.value = (Float)(questionNumber.value) / (Float)(totalQuestionCount) * 100.0
            return true
        } else {
            return false
        }
    }
}
