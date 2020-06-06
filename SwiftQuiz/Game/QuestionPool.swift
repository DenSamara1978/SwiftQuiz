//
//  QuestionPool.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

class QuestionPool {
    private var questions: [Question]
    
    public init ( questions: [Question] ) {
        self.questions = questions
    }
    
    var count: Int {
        return questions.count
    }
    
    func getQuestion ( number: Int ) -> Question? {
        if (( number >= 0 ) && ( number < count )) {
            return questions [number]
        } else {
            return nil
        }
    }
    
    func removeQuestion ( number: Int ) {
        if (( number >= 0 ) && ( number < count )) {
            questions.remove(at: number)
        }
    }
}
