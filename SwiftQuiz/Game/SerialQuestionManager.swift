//
//  SerialQuestionManager.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 05.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

class SerialQuestionManager : QuestionManager {
    private let questionPool: QuestionPool
    private var currentQuestionIndex : Int

    public init () {
        questionPool = QuestionPool ( questions: Game.shared.questionSet )
        currentQuestionIndex = -1
    }
    
    func nextQuestion() -> Question? {
        currentQuestionIndex += 1
        if ( currentQuestionIndex > questionPool.count ) {
            return nil
        } else {
            return questionPool.getQuestion(number: currentQuestionIndex)
        }
    }

    func getQuestionCount () -> Int {
        return questionPool.count
    }
}
