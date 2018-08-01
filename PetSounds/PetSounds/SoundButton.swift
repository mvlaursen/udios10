//
//  AnimalSoundButton.swift
//  PetSounds
//
//  Created by Mike Laursen on 8/1/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class SoundButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable public var filename: String? = nil
    @IBInspectable public var filenameExtension: String? = ".wav"
}
