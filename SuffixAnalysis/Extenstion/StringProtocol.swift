//
//  StringProtocol.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 12.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

extension StringProtocol {
    var words: [SubSequence] {
        split(whereSeparator: \.isLetter.negation)
    }
}
