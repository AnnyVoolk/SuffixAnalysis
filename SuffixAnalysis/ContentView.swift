//
//  ContentView.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 02.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: BaseViewModel
    
    @State private var selection = 0
    var rubrics = ["All suffix", "Top 10 \"3 let\"", "Top 10 \"5 let\"", "Feed"]

    var body: some View {
        VStack {
            Picker("Options", selection:  self.$selection) {
                ForEach(0 ..< self.rubrics.count) { index in
                    Text(self.rubrics[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            if selection == 0 {
                AllSuffixView()
            } else if selection == 1 {
                Top3Suffix()
            } else if selection == 2 {
                Top5Suffix()
            } else {
                Feed(jobScheduler: self.model.jobScheduler, values: self.model.texts)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
