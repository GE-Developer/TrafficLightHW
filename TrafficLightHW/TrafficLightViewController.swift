//
//  ViewController.swift
//  TrafficLightHW
//
//  Created by M I C H A E L on 16.03.2023.
//

import UIKit

enum Light {
    
    case red, yellow, green
}

class TrafficLightViewController: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    
// MARK: - Private Properties
    
    private var nextLight = Light.red
    
    private let redLight = (on: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), off: #colorLiteral(red: 0.3, green: 0, blue: 0, alpha: 1))
    private let yellowLight = (on: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), off: #colorLiteral(red: 0.3, green: 0.2958364945, blue: 0, alpha: 1))
    private let greenLight = (on: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), off: #colorLiteral(red: 0, green: 0.3, blue: 0, alpha: 1))
    
/*
 Не стал использовать .alpha, так как при смене бэкграунда у супервью не
 будет эффекта затемнения
*/
    
    
// MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.backgroundColor = redLight.off
        yellowLightView.backgroundColor = yellowLight.off
        greenLightView.backgroundColor = greenLight.off
    }
    
    override func viewWillLayoutSubviews() {
        
        startButton.layer.cornerRadius = startButton.frame.height / 3
        
        for lightView in [redLightView, yellowLightView, greenLightView] {
            lightView?.layer.cornerRadius = (lightView?.frame.height ?? 0) / 2
        }
    }
    
    
// MARK: - IBActions
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        turnOnTheNextLight()
        
        if startButton.titleLabel?.text == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
    }
    
    
// MARK: - Private Methods
    
    private func turnOnTheNextLight() {
        
        switch nextLight {
            
        case .red:
            redLightView.backgroundColor = redLight.on
            greenLightView.backgroundColor = greenLight.off
            nextLight = .yellow
            
        case .yellow:
            yellowLightView.backgroundColor = yellowLight.on
            redLightView.backgroundColor = redLight.off
            nextLight = .green
            
        case .green:
            greenLightView.backgroundColor = greenLight.on
            yellowLightView.backgroundColor = yellowLight.off
            nextLight = .red
        }
    }
}

