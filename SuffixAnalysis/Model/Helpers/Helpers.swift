//
//  Helpers.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 02.12.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import Foundation

struct Helpers {
    
    func setSuffixSequenceArray(text: String) -> [SuffixSequence] {
        text.words.map { SuffixSequence(string: String($0)) }
    }
    
    @discardableResult
    func setSuffixArray(wordSequence: SuffixSequence, previousArr: [Suffix] = []) -> [Suffix] {
        var resultArr = previousArr
        wordSequence.forEach { subString in
            let suffix = String(subString).lowercased()
            guard let currentElement = resultArr.first(where: { $0.title == suffix }) else {
                resultArr.append(Suffix(title: suffix, count: 1))
                return
            }
            currentElement.count += 1
        }
        return resultArr
    }
}
