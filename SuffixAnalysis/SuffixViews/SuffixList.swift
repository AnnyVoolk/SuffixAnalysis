//
//  SuffixList.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 11.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct SuffixList: View {
    
    var values: [Suffix]
    
    var body: some View {
        List {
            ForEach(self.values) { suffix in
                HStack {
                    Text(suffix.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("(\(suffix.count))")
                }
            }
        }
    }
}

struct SuffixList_Previews: PreviewProvider {
    static var previews: some View {
        SuffixList(values: [])
    }
}
