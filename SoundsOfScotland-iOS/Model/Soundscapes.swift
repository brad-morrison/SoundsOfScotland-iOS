//
//  Soundscapes.swift
//  SoundsofScotland
//
//  Created by Brad on 05/09/2022.
//

import SwiftUI

struct Soundscape: Identifiable {
    var id = UUID()
    var title: String
    var image: Image
}

var soundscapes = [
    Soundscape(title: "Loch Ness Shores", image: Image("0")),
    Soundscape(title: "Fairy Pools", image: Image("1")),
    Soundscape(title: "West Sands Beach", image: Image("2")),
    Soundscape(title: "Orkney Cliffs", image: Image("3")),
    Soundscape(title: "Highland Stream", image: Image("4")),
    Soundscape(title: "Edinburgh Festival", image: Image("5")),
    Soundscape(title: "Loch Lomond", image: Image("6")),
    Soundscape(title: "Tentsmuir Forest", image: Image("3")),
]
