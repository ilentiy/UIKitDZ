//
//  PlayerViewController.swift
//  UIKitDZMain
//
//  Created by Илья on 26.09.2022.
//

import UIKit

/// Библиотека для работы плеера
import AVFoundation

/// Плеер
class PlayerViewController: UIViewController {
    
    var song = Song()
    
    var player = AVAudioPlayer()
    
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var songTimeSlider: UISlider!
    @IBOutlet weak var playSongButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var lastsLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPlayer()
    }
    
    func setupUI() {
        albumNameLabel.text = song.album
        albumImageView.image = UIImage(named: song.image)
        songNameLabel.text = song.name
        artistNameLabel.text = song.artist
    }
    
    @IBAction func playAction(_ sender: UIButton!) {
        if player.isPlaying {
            sender.setImage(UIImage(systemName: "play.fill"), for: .normal)
            player.stop()
        } else {
            sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            player.play()
        }
    }
    
    @IBAction func dissmissAction(_ sender: Any) {
        dismiss(animated: true )
    }
    
    func setupPlayer() {
        let songPath = Bundle.main.path(forResource: song.track, ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: songPath ?? "eror"))
        } catch {
            print("Error")
        }
        player.play()
    }
}
