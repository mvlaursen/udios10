//
//  SettingsViewController.swift
//  Doodle Bug
//
//  Created by Mike Laursen on 7/30/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewControllerFinished(_ settingsViewController: SettingsViewController)
}

class SettingsViewController: UIViewController {
    var delegate: SettingsViewControllerDelegate? = nil
    
    @IBOutlet private weak var brushImage: UIImageView!
    
    @IBOutlet private weak var opacityLabel: UILabel!
    @IBOutlet private weak var opacitySlider: UISlider!
    
    @IBOutlet private weak var strokeWidthSlider: UISlider!
    @IBOutlet private weak var strokeWidthLabel: UILabel!
    
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    private var strokeColor = UIColor.black.cgColor
    
    var color: CGColor {
        get {
            return UIColor(displayP3Red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(opacitySlider.value)).cgColor
        }
        set(newColor) {
            strokeColor = newColor
         }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let targetColorSpace = CGColorSpace(name: CGColorSpace.sRGB)
        let rgbColor = strokeColor.converted(to: targetColorSpace!, intent: CGColorRenderingIntent.defaultIntent, options: nil)
        redSlider.setValue(Float(255.0 * rgbColor!.components![0]), animated: true)
        greenSlider.setValue(Float(255.0 * rgbColor!.components![1]), animated: true)
        blueSlider.setValue(Float(255.0 * rgbColor!.components![2]), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func adjustColor(_ sender: Any) {
    }
    
    @IBAction func adjustOpacity(_ sender: UISlider) {
    }
    
    @IBAction func adjustStrokeWidth(_ sender: UISlider) {
    }
    
    @IBAction func exit(_ sender: UIButton) {
    }
}
