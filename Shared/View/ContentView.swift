//
//  ContentView.swift
//  MyActivies
//
//  Created by Luca Hummel on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activitiesViewModel = ActivitiesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activitiesViewModel.activities) { activity in
                    NavigationLink {
                        DetailedView(activity: activity)
                            .environmentObject(activitiesViewModel)
                    } label: {
                        ActivityCell(activity: activity)
                    }
                }
                #if !os(watchOS)
                .onDelete(perform: delete)
                #endif
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.update)) { obj in
                    if let userInfo = obj.userInfo, let title = userInfo["title"] {
                        activitiesViewModel.activities.removeAll { $0.title == title as! String
                        }
                    }
                }
            }
            .navigationTitle(Text("My Activities"))
        }
    }
    
    func delete(offsets: IndexSet) {
        offsets.forEach { index in
            ConnectivityManager.shared.send(activity: activitiesViewModel.activities[index])
        }
        activitiesViewModel.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
