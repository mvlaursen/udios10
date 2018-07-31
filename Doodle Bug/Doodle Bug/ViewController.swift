//
//  ViewController.swift
//  Doodle Bug
//
//  Created by Mike Laursen on 7/30/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    var previousPoint = CGPoint.zero
    var strokeColor = UIColor.black.cgColor
    var strokeWidth = CGFloat(2.0)
    var swiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsViewController = segue.destination as! SettingsViewController
        settingsViewController.delegate = self
        settingsViewController.strokeColor = strokeColor
        settingsViewController.strokeWidth = strokeWidth
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        assert(!self.view.isMultipleTouchEnabled)
        if let touch = touches.first as UITouch? {
            previousPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(previousPoint, toPoint: previousPoint)
            previousPoint = CGPoint.zero
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        assert(!self.view.isMultipleTouchEnabled)
        if let touch = touches.first as UITouch? {
            let currentPoint = touch.location(in: view)
            drawLine(previousPoint, toPoint: currentPoint)
            previousPoint = currentPoint
        }
    }
    
    @IBAction func colorAction(_ sender: UIButton) {
        switch sender.restorationIdentifier {
        case "red": strokeColor = UIColor.red.cgColor
        case "blue": strokeColor = UIColor.blue.cgColor
        case "green": strokeColor = UIColor.green.cgColor
        case "yellow": strokeColor = UIColor.yellow.cgColor
        case "pink": strokeColor = UIColor.magenta.cgColor
        case "teal": strokeColor = UIColor(displayP3Red: 0/255, green: 128/255, blue: 128/255, alpha: 1.0).cgColor
        case "white": strokeColor = UIColor.white.cgColor
        default: strokeColor = UIColor.black.cgColor
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        imageView.image = nil
        previousPoint = CGPoint.zero
        strokeColor = UIColor.black.cgColor
    }
    
    @IBAction func save(_ sender: UIButton) {
    }
        
    // Utility functions
    
    private func drawLine(_ fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setBlendMode(.normal)
        context?.setLineCap(.round)
        context?.setLineWidth(strokeWidth)
        context?.setStrokeColor(strokeColor)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
}

extension ViewController: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(_ settingsViewController: SettingsViewController) {
        strokeColor = settingsViewController.strokeColor
        strokeWidth = settingsViewController.strokeWidth
    }
}

