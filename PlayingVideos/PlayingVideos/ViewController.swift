//
//  ViewController.swift
//  PlayingVideos
//
//  Created by Mike Laursen on 8/1/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import AVFoundation
import AVKit
import UIKit

class ViewController: UIViewController {
    var playerController = AVPlayerViewController()
    var player: AVPlayer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "Video", ofType: ".mp4")
        
        assert(path != nil)
        if path != nil {
            player = AVPlayer(url: URL(fileURLWithPath: path!))
            playerController.player = player
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func playVideo(_ sender: UIButton) {
        self.present(playerController, animated: true) {
            self.playerController.player?.play()
        }
    }
}

