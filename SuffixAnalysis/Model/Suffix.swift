//
//  Suffix.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 11.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import Foundation

class Suffix {
    
    init(title: String, count: Int) {
        self.title = title
        self.count = count
    }
    
    var title: String
    var count: Int
}

extension Suffix: Identifiable {
    var id: String {
        UUID().uuidString
    }
}
