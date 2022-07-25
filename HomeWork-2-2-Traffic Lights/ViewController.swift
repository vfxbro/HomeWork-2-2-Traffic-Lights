//
//  ViewController.swift
//  HomeWork-2-2-Traffic Lights
//
//  Created by vfxbro on 25.07.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var trafficLightRedView: UIView!
    @IBOutlet var trafficLightYellowView: UIView!
    @IBOutlet var trafficLightGreenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        startButton.layer.cornerRadius = 10
        
        trafficLightRedView.alpha = lightIsOff
        trafficLightYellowView.alpha = lightIsOff
        trafficLightGreenView.alpha = lightIsOff
        
        startButton.setTitle("Start", for: .normal)
        
        print("Размер стороны доступный из viewDidLoad: ", trafficLightRedView.frame.height)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        trafficLightRedView.layer.cornerRadius = trafficLightRedView.frame.width / 2
        trafficLightYellowView.layer.cornerRadius = trafficLightRedView.frame.width / 2
        trafficLightGreenView.layer.cornerRadius = trafficLightRedView.frame.width / 2
        
        print("Размер стороны доступный из viewWillLayoutSubviews: ", trafficLightRedView.frame.height)
    }

    @IBAction func makeButtonAction() {
        
        startButton.setTitle("Next", for: .normal)
        
        switch currentLight {
        case .red:
            trafficLightGreenView.alpha = lightIsOff
            trafficLightRedView.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            trafficLightRedView.alpha = lightIsOff
            trafficLightYellowView.alpha = lightIsOn
            currentLight = .green
        case .green:
            trafficLightGreenView.alpha = lightIsOn
            trafficLightYellowView.alpha = lightIsOff
            currentLight = .red
        
        }
        
    }
    
}

