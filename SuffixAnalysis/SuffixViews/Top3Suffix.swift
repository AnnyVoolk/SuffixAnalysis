//
//  Top3Suffix.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 11.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct Top3Suffix: View {
    
    @EnvironmentObject var model: BaseViewModel
    
    var body: some View {
        VStack {
            SortButtons(
                ascSorting: ({ self.model.sortTop3SuffixArray(isAsc: true) }),
                descSoritng: ({ self.model.sortTop3SuffixArray(isAsc: false) })
            )
            SuffixList(values: model.top3SuffixArray)
        }
    }
}

struct Top3Suffix_Previews: PreviewProvider {
    static var previews: some View {
        Top3Suffix()
    }
}
