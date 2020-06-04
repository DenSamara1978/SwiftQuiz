//
//  QuestionPool.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

class QuestionPool {
    private let questions: [Question] = [
        Question ( question: "Как называется столица Чили?", answers: ["Кальяри", "Сантьяго", "Буэнос-Айрес", "Монтевидео"], rightAnswer: 1 ),
        Question ( question: "В каких единицах в системе СИ измеряется сила тока?", answers: ["Ампер", "Вольт", "Ом", "Ватт"], rightAnswer: 0 ),
        Question ( question: "Как называются соли соляной кислоты?", answers: ["Сульфиды", "Хроматиты", "Хлориды", "Нитраты"], rightAnswer: 2 ),
        Question ( question: "Как звали русского императора, называемого Освободителем?", answers: ["Александр I", "Николай II", "Александр III", "Николай I"], rightAnswer: 0 ),
        Question ( question: "Элемент ходовой части вагона, соединяющий тележку и колесную пару?", answers: ["Цапфа", "Шейка", "Ось", "Букса"], rightAnswer: 3 ),
        Question ( question: "Что является основным элементарным функциональным элементом современной электроники?", answers: ["Транзистор", "Резистор", "Диод", "Конденсатор"], rightAnswer: 0 ),
    ]
    
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
}
