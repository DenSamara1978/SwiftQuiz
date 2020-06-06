//
//  RandomQuestionManager.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 05.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

class RandomQuestionManager : QuestionManager {
    private let questionPool: QuestionPool

    public init () {
        questionPool = QuestionPool ( questions: Game.shared.questionSet )
    }

    func nextQuestion() -> Question? {
        if ( questionPool.count == 0 ) {
            return nil
        }
        var num = 0
        if ( questionPool.count > 1 ) {
            num = Int(arc4random_uniform(UInt32(questionPool.count)))
        }
        let question = questionPool.getQuestion(number: num)
        questionPool.removeQuestion ( number: num )
        return question
    }

    func getQuestionCount () -> Int {
        return questionPool.count
    }
}
