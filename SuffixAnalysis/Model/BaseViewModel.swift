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
    
    init() {
        let defaults = UserDefaults(suiteName: "group.Anna-Volkova.SuffixAnalysis")
        defaults?.synchronize()
        let textString = defaults?.string(forKey: "text") ?? "Test first name, test first surname"
        let wordsSuffixArray = textString.words.map { SuffixSequence(string: String($0)) }
        wordsSuffixArray.forEach { [weak self] wordSequence in
            guard let strongify = self else { return }
            strongify.setSuffixArray(wordSequence: wordSequence)
        }
        self.suffixArray = self.suffixArray.sorted(by: { $0.title < $1.title })
        self.top3SuffixArray = Array(self.suffixArray.filter { $0.title.count == 3 }.sorted(by: { $0.count > $01.count }).prefix(10))
        self.top5SuffixArray = Array(self.suffixArray.filter { $0.title.count == 5 }.sorted(by: { $0.count > $01.count }).prefix(10))
    }
    
    func setSuffixArray(wordSequence: SuffixSequence) {
        wordSequence.forEach { [weak self] subString in
            guard let strongify = self else { return }
            let suffix = String(subString).lowercased()
            guard let currentElement = strongify.suffixArray.first(where: { $0.title == suffix }) else {
                strongify.suffixArray.append(Suffix(title: suffix, count: 1))
                return
            }
            currentElement.count += 1
        }
    }
    
    func sortSuffixArray(isAsc: Bool) {
        self.suffixArray = self.suffixArray.sorted(by: { isAsc ? $0.title < $1.title : $0.title > $1.title })
    }
}
