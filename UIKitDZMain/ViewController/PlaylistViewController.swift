//
//  ViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 21.09.2022.
//

import AVFoundation
import UIKit

/// Контроллер Плэйлиста
final class PlaylistViewController: UIViewController {
    
    @IBOutlet weak var firstSongButton: UIButton!
    
    @IBOutlet weak var secondSongButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func firstSongPlayAction(_ sender: Any) {
        let firstSong = Song()
        firstSong.name = "Не норм"
        firstSong.artist = "Anacondaz"
        firstSong.album = "Single"
        firstSong.image = "ne_norm"
        playSong(song: firstSong)
    }
    
    @IBAction func secondSongPlayAction(_ sender: Any) {
        let secondSong = Song()
        secondSong.name = "Два вопроса"
        secondSong.artist = "Anacondaz"
        secondSong.album = "Перезвони мне"
        secondSong.image = "dva_voprosa"
        playSong(song: secondSong)
    }
    
    func playSong(song: Song) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let playerViewController = storyboard.instantiateViewController(
            withIdentifier: "PlayerViewController") as? PlayerViewController else { return }
        playerViewController.song = song
        playerViewController.modalPresentationStyle = .formSheet
        present(playerViewController, animated: true)
        
    }
    
}
