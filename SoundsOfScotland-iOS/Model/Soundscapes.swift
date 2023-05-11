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
    var path: String
}

var soundscapes = [
    Soundscape(title: "Loch Ness Shores", image: Image("0"), path: "audioFile"),
    Soundscape(title: "Fairy Pools", image: Image("1"), path: "fairy_pools"),
    Soundscape(title: "West Sands Beach", image: Image("2"), path: "west_sands_beach"),
    Soundscape(title: "Orkney Cliffs", image: Image("3"), path: "orkney_cliffs"),
    Soundscape(title: "Highland Stream", image: Image("4"), path: "highland_stream"),
    Soundscape(title: "Edinburgh Festival", image: Image("5"), path: "edinburgh_festival"),
    Soundscape(title: "Loch Lomond", image: Image("6"), path: "loch_lomond"),
    Soundscape(title: "Tentsmuir Forest", image: Image("3"), path: "tentsmuir_forest"),
]

