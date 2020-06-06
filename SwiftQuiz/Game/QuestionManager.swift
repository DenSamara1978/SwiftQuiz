//
//  QuestionManager.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 05.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

protocol QuestionManager {
    func nextQuestion () -> Question?
    func getQuestionCount () -> Int
}
