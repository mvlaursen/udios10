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
    public var strokeWidth = CGFloat(0.0)
    
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
        let red = rgbColor!.components![0]
        let green = rgbColor!.components![1]
        let blue = rgbColor!.components![2]
        let opacity = rgbColor!.components![3]
        redSlider.setValue(Float(red), animated: false)
        greenSlider.setValue(Float(green), animated: false)
        blueSlider.setValue(Float(blue), animated: false)
        opacityLabel.text = "Opacity: \(opacity)"
        opacitySlider.setValue(Float(opacity), animated: false)

        strokeWidthLabel.text = "Stroke Width: \(strokeWidth)"
        strokeWidthSlider.setValue(Float(strokeWidth), animated: false)
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
