//
//  EmergencyInput.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/7/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class EmergencyInput: UIViewController {
    
    @IBOutlet weak var UrgencySlider: UISlider!
    @IBOutlet weak var UrgencyLabel: UILabel!
    
    @IBAction func SliderChanged(_ sender: UISlider) {
        UrgencyLabel.text = String(UrgencySlider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
