//
//  BaseViewModel.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 10.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import Foundation
import CustomSave

class BaseViewModel: ObservableObject {
    
    @Published var suffixArray = [Suffix]()
    @Published var top3SuffixArray = [Suffix]()
    @Published var top5SuffixArray = [Suffix]()
    
    @Published var texts = [String]()
    @Published var jobScheduler: JobScheduler
    
    let longText = "group.Anna-Volkova.SuffixAnalysis"
    
    init() {
        let defaults = UserDefaults(suiteName: "group.Anna-Volkova.SuffixAnalysis")
        defaults?.synchronize()
        
        let texts = defaults?.array(forKey: "textArr") as? [String] ?? TestStrings().texts
        let jobQueue = texts.compactMap { JobQueue($0) }
        self.texts = texts
        self.jobScheduler = JobScheduler(jobQueues: jobQueue)
        
        let textString = defaults?.string(forKey: "text") ?? "Test first name, test first surname"
        let wordsSuffixArray = Helpers().setSuffixSequenceArray(text: textString)
        wordsSuffixArray.forEach { [weak self] wordSequence in
            guard let strongify = self else { return }
            strongify.suffixArray = Helpers().setSuffixArray(wordSequence: wordSequence, previousArr: strongify.suffixArray)
        }
        self.suffixArray = self.suffixArray.sorted(by: { $0.title < $1.title })
        self.top3SuffixArray = Array(self.suffixArray.filter { $0.title.count == 3 }.sorted(by: { $0.count > $01.count }).prefix(10))
        self.top5SuffixArray = Array(self.suffixArray.filter { $0.title.count == 5 }.sorted(by: { $0.count > $01.count }).prefix(10))
    }
    
    func sortSuffixArray(isAsc: Bool) {
        self.suffixArray = self.suffixArray.sorted(by: { isAsc ? $0.title < $1.title : $0.title > $1.title })
    }
}
