//
//  Game.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

class Game {
    public var gameSession: GameSession?
    public static let shared = Game ()
    private let recordsCaretaker = RecordsCaretaker()
    private(set) var records: [Float] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }

    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }

    public func beginGameSession () {
        gameSession = GameSession ()
    }
    
    public func terminateGameSession () {
        self.gameSession = nil
    }
    
    public func endGameSession () {
        guard let gameSession = gameSession else { return }
        let result = gameSession.getResult ()
        let total = (Float)(result.0)
        let right = (Float)(result.1)
        addRecord ( record: right / total * 100.0 )
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
