//
//  RecordsCaretaker.swift
//  SwiftQuiz
//
//  Created by Denis Vlaskin on 04.06.2020.
//  Copyright © 2020 Denis Vlaskin. All rights reserved.
//

import Foundation

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(records: [Float]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Float] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Float].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
