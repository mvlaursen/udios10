//
//  ViewController.swift
//  PetSounds
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

    @IBAction func playSound(_ sender: UIButton) {
        if player != nil {
            player!.stop()
            player = nil
        }
        
        let soundButton = sender as! SoundButton
        let path = Bundle.main.path(forResource: soundButton.filename, ofType: soundButton.filenameExtension)
            
        assert(path != nil)
        if path != nil {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                player?.play()
            } catch {
                print(error)
            }
        }
    }
}

