//
//  ActivitiesViewModel.swift
//  MyActivies
//
//  Created by Luca Hummel on 24/10/22.
//

import Foundation

class ActivitiesViewModel: ObservableObject {
    @Published var activities: [Activity] = [
        Activity(symbol: "gamecontroller.fill", title: "Videogame"),
        Activity(symbol: "book.fill", title: "Read"),
        Activity(symbol: "play.tv.fill", title: "Movie"),
        Activity(symbol: "headphones", title: "Music"),
        Activity(symbol: "paperplane.fill", title: "Message"),
        Activity(symbol: "sun.max.fill", title: "Sun")
    ]
}
