//
//  SuffixSequence.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 10.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct SuffixSequence: Sequence{
    
    let string: String
    func makeIterator() -> SuffixInteractor {
        return SuffixInteractor(string: self.string)
    }
}
