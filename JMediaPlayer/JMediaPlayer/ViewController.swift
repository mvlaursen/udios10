//
//  ViewController.swift
//  JMediaPlayer
//
//  Created by Mike Laursen on 7/31/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    var player: AVAudioPlayer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pauseMusic(_ sender: UIButton) {
        if player != nil {
            if player!.isPlaying {
                player!.pause()
            } else {
                player!.play()
            }
        }
    }
    
    @IBAction func playMusic(_ sender: UIButton) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Music", ofType: ".mp3")!)
        play(url)
    }
        
    @IBAction func stopMusic(_ sender: UIButton) {
        player?.stop()
        player = nil
    }
    
    @IBAction func playSoundEffect(_ sender: UIButton) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "Sound", ofType: ".wav")!)
        play(url)
    }
    
    // Utility functions
    
    func play(_ url: URL) {
        if player != nil {
            player!.stop()
            player = nil
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error)
        }
    }
    
}

