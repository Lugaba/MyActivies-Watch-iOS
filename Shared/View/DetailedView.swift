//
//  Detailed.swift
//  MyActivies
//
//  Created by Luca Hummel on 24/10/22.
//

import SwiftUI

struct DetailedView: View {
    var activity: Activity
    @EnvironmentObject var activitiesViewModel: ActivitiesViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text(activity.title)
#if os(watchOS)
            Spacer()
            Button {
                ConnectivityManager.shared.send(activity: activity)
                activitiesViewModel.activities.removeAll { $0.id == activity.id }
                dismiss()
            } label: {
                Text("Delete")
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
#endif
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(activity: Activity(symbol: "book.fill", title: "Read"))
    }
}
