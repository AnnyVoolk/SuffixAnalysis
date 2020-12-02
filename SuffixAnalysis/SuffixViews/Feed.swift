//
//  Feed.swift
//  SuffixAnalysis
//
//  Created by Anna Volkova on 26.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import SwiftUI

struct Feed: View {
    
    @ObservedObject var jobScheduler: JobScheduler
    var values: [String]
    
    init(jobScheduler: JobScheduler, values: [String]) {
        self.jobScheduler = jobScheduler
        self.values = values
    }
    
    var body: some View {
        VStack() {
            Button(action: self.startProcess) {
                Image(systemName: "play.fill")
                    .padding(.leading)
                Text("Start process")
                Spacer()
            }
            List {
                ForEach(self.values.indices, id: \.self) { index in
                    HStack {
                        Text(self.values[index])
                            .font(.headline)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                        Text(self.jobScheduler.times[index]).padding(.leading, 10)
                    }
                }
            }
        }
    }
    
    func startProcess() {
        self.jobScheduler.start()
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed(jobScheduler: JobScheduler(jobQueues: []), values: [])
    }
}
