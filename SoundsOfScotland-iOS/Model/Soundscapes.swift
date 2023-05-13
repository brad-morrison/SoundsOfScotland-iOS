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
    var image: String
    var path: String
    var fav: Bool
}

var soundscapes = [
    Soundscape(title: "Loch Ness Shores", image: "0", path: "audioFile", fav: false),
    Soundscape(title: "Fairy Pools", image: "1", path: "fairy_pools", fav: false),
    Soundscape(title: "West Sands Beach", image: "2", path: "west_sand s_beach", fav: false),
    Soundscape(title: "Orkney Cliffs", image: "3", path: "orkney_cliffs", fav: false),
    Soundscape(title: "Highland Stream", image: "4", path: "highland_stream", fav: false),
    Soundscape(title: "Edinburgh Festival", image: "5", path: "edinburgh_festival", fav: false),
    Soundscape(title: "Loch Lomond", image: "6", path: "loch_lomond", fav: false),
    Soundscape(title: "Tentsmuir Forest", image: "3", path: "tentsmuir_forest", fav: true),
]

