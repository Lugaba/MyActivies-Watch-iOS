//
//  ActivityCell.swift
//  MyActivies
//
//  Created by Luca Hummel on 24/10/22.
//

import SwiftUI

struct ActivityCell: View {
    var activity: Activity
    var body: some View {
        HStack {
            Image(systemName: activity.symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(.yellow)
            Text(activity.title)
        }
    }
}

struct ActivityCell_Previews: PreviewProvider {
    static var previews: some View {
         ActivityCell(activity: Activity(symbol: "book.fill", title: "Read"))
    }
}
