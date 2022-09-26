//
//  Song.swift
//  UIKitDZMain
//
//  Created by Илья on 26.09.2022.
//

import Foundation

/// информация о песне
class Song {
    var name: String = ""
    var artist: String = ""
    var album: String = ""
    var image: String = ""
    var track: String {
        "\(artist) - \(name)"
    }
}
