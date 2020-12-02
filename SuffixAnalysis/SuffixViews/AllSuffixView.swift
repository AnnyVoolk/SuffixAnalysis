//
//  AllSuffixView.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 10.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct AllSuffixView: View {
    
    @EnvironmentObject var model: BaseViewModel
    
    var body: some View {
        VStack {
            SortButtons(
                ascSorting: ({ self.model.sortSuffixArray(isAsc: true) }),
                descSoritng: ({ self.model.sortSuffixArray(isAsc: false) })
            )
            SuffixList(values: self.model.suffixArray)
        }
    }
}

struct AllSuffixView_Previews: PreviewProvider {
    static var previews: some View {
        AllSuffixView()
    }
}
