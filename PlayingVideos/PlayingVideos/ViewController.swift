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
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var playerController = AVPlayerViewController()
    var player: AVPlayer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = "https://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_5mb.mp4"
        let url = URL(string: path)
        
        if url != nil {
            player = AVPlayer(url: url!)
            playerController.player = player
        }
        
        let embedCode = "<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/VNKU4hSz3SU\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"
        webView.loadHTMLString(embedCode, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func streamVideo(_ sender: UIButton) {
        present(playerController, animated: true) {
            self.playerController.player?.play()
        }
    }
}

