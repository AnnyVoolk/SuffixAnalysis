//
//  SortButtons.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 11.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct SortButtons: View {
    
    var ascSorting: () -> Void
    var descSoritng: () -> Void
    
    var body: some View {
        HStack {
            Button(action: self.ascSorting) {
                Text("Sort by ASC")
            }.padding(.leading, 20)
            Spacer()
            Button(action: self.descSoritng) {
                Text("Sort by DESC")
            }.padding(.trailing, 20)
        }
    }
}

struct SortButtons_Previews: PreviewProvider {
    static var previews: some View {
        SortButtons(ascSorting: {}, descSoritng: {})
    }
}
