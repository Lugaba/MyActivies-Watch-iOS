//
//  Activity.swift
//  MyActivies
//
//  Created by Luca Hummel on 24/10/22.
//

import Foundation

struct Activity: Identifiable {
    var id: UUID = UUID()
    var symbol: String
    var title: String
}
