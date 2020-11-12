//
//  Top5Suffix.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 11.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct Top5Suffix: View {
    
    @EnvironmentObject var model: BaseViewModel
    
    var body: some View {
        VStack {
            SuffixList(values: model.top5SuffixArray)
        }
    }
}

struct Top5Suffix_Previews: PreviewProvider {
    static var previews: some View {
        Top5Suffix()
    }
}
