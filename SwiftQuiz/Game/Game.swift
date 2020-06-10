//
//  Game.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

class Game {
    public static let shared = Game ()
    
    public var gameSession: GameSession?
    public var questionMode: QuestionMode = .serial
    
    private let recordsCaretaker = RecordsCaretaker()
    private(set) var records: [Float] {
        didSet {
            recordsCaretaker.saveRecords(records: self.records)
        }
    }
    
    private let questionsCaretaker = QuestionCaretaker()
    private(set) var questionSet: [Question] {
        didSet {
            questionsCaretaker.saveQuestions(questions: self.questionSet)
        }
    }

    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.questionSet = self.questionsCaretaker.retrieveQuestions()
        if ( self.questionSet.count == 0 ) {
            generateDefaultQuestions()
        }
    }

    private func generateDefaultQuestions () {
        questionSet = [
            Question ( question: "Как называется столица Чили?", answers: ["Кальяри", "Сантьяго", "Буэнос-Айрес", "Монтевидео"], rightAnswer: 1 ),
            Question ( question: "В каких единицах в системе СИ измеряется сила тока?", answers: ["Ампер", "Вольт", "Ом", "Ватт"], rightAnswer: 0 ),
            Question ( question: "Как называются соли соляной кислоты?", answers: ["Сульфиды", "Хроматиты", "Хлориды", "Нитраты"], rightAnswer: 2 ),
            Question ( question: "Как звали русского императора, называемого Освободителем?", answers: ["Александр I", "Николай II", "Александр III", "Николай I"], rightAnswer: 0 ),
            Question ( question: "Элемент ходовой части вагона, соединяющий тележку и колесную пару?", answers: ["Цапфа", "Шейка", "Ось", "Букса"], rightAnswer: 3 ),
            Question ( question: "Что является основным элементарным функциональным элементом современной электроники?", answers: ["Транзистор", "Резистор", "Диод", "Конденсатор"], rightAnswer: 0 ),
        ]
    }

    public func appendNewQuestion ( question: Question ) {
        questionSet.append(question)
    }


    public func beginGameSession ( ) {
        gameSession = GameSession ( mode: questionMode )
    }
    
    public func terminateGameSession () {
        self.gameSession = nil
    }
    
    public func endGameSession () {
        guard let gameSession = gameSession else { return }
        addRecord ( record: gameSession.getCurrentResult ())
        terminateGameSession ()
    }
    
    public func clearRecords () {
        records = []
    }
    
    private func addRecord ( record: Float ) {
        records.append ( record )
    }
    
    public func getRecordsCount () -> Int {
        return records.count
    }
    
    public func getRecordsByIndex (index: Int) -> Float? {
        guard (( index >= 0 ) && ( index < records.count )) else { return nil }
        return records [index]
    }
}
