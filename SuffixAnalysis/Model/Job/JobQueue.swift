//
//  JobQueue.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 24.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

class JobQueue {
    
    var processTime: String = "-"
    
    private var suffixSequenceArr = [SuffixSequence]()
    
    init(_ text: String) {
        self.suffixSequenceArr = Helpers().setSuffixSequenceArray(text: text)
    }
    
    func enqueue(_ text: String) {
        let newArr = Helpers().setSuffixSequenceArray(text: text)
        self.suffixSequenceArr.append(contentsOf: newArr)
    }
    
    func dequeue() -> SuffixSequence? {
        guard !self.suffixSequenceArr.isEmpty else { return nil }
        return self.suffixSequenceArr.removeFirst()
    }
    
    func start(index: Int, completion: @escaping () -> Void) {
        print("start index \(index)")
        let startDate = Date()
        
        self.suffixSequenceArr.forEach { Helpers().self.setSuffixArray(wordSequence: $0)}
        
        // Сделано с небольшой задержкой, чтобы в итоге разные числа выводить. Иначне очень быстро выполняется
        DispatchQueue.main.asyncAfter (deadline: .now() + (index == 0 ? 5 : 1)) {
            self.setProcessTime(startDate: startDate, stopDate: Date())
            completion()
            print("stoped index \(index)")
        }
    }
    
    func setProcessTime(startDate: Date, stopDate: Date) {
        let time = stopDate.timeIntervalSince(startDate)
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        var times: [String] = []
        if hours > 0 {
            times.append("\(hours)h")
        }
        if minutes > 0 {
            times.append("\(minutes)m")
        }
        times.append("\(seconds)s")
        
        self.processTime = times.isEmpty ? "0s" : times.joined(separator: " ")
    }
}
