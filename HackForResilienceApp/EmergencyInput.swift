//
//  EmergencyInput.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/7/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class EmergencyInput: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NaturalDisasterArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NaturalDisasterArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enteredNaturalDisaster = NaturalDisasterArray[row]
        checkRequirements()
        
    }
    
    var enteredNaturalDisaster: String = ""
    
    var NaturalDisasterArray: [String] = ["Tornado", "Hurricane", "Earthquake", "Flood", "Storm", "Avalanche", "Volcanic Eruption", "Blizzard"]
    
    var urgency: Int = 0
    var isEmergency: Bool = false
    var ButtonIsPressed: Bool = false
    var safeButtonPressed: Bool = false

    @IBOutlet weak var DisasterPickerView: UIPickerView!
    
    @IBOutlet weak var UrgencySlider: UISlider!
    @IBOutlet weak var SendButton: UIButton!
    
    @IBOutlet weak var UrgencyLabel: UILabel!
    
    @IBAction func SliderChanged(_ sender: UISlider) {
        UrgencyLabel.text = "Urgency: \(Int(UrgencySlider.value))"
        urgency = Int(UrgencySlider.value)
        print(urgency)
        checkRequirements()
    }
    @IBOutlet weak var EmergencyButton: UIButton!
    @IBOutlet weak var SafeButton: UIButton!
    
    @IBAction func EmergencyButtonClicked(_ sender: UIButton) {
        SafeButton.backgroundColor = UIColor.gray
        EmergencyButton.backgroundColor = UIColor.red
        UrgencySlider.isHidden = false
        UrgencySlider.isEnabled = true
        UrgencyLabel.isHidden = false
        UrgencyLabel.isEnabled = true
        DisasterPickerView.isHidden = false
        ButtonIsPressed = true
        DisasterPickerView.isUserInteractionEnabled = true
        
        isEmergency = true
        checkRequirements()
        safeButtonPressed = false

    }
    
    @IBAction func SendButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func SafeButtonClicked(_ sender: Any) {
        EmergencyButton.backgroundColor = UIColor.gray
        SafeButton.backgroundColor = UIColor.green
        UrgencySlider.isHidden = true
        UrgencySlider.isEnabled = false
        UrgencyLabel.isHidden = true
        UrgencyLabel.isEnabled = false
        DisasterPickerView.isHidden = false
        safeButtonPressed = true

        DisasterPickerView.isUserInteractionEnabled = true
        isEmergency = false
        ButtonIsPressed = true
        checkRequirements()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        UrgencySlider.setValue(Float(urgency), animated: false)
        SafeButton.backgroundColor = UIColor.green
        EmergencyButton.backgroundColor = UIColor.red
        UrgencySlider.isHidden = true
        UrgencySlider.isEnabled = false
        UrgencyLabel.isHidden = true
        UrgencyLabel.isEnabled = false
        DisasterPickerView.isHidden = true
        DisasterPickerView.isUserInteractionEnabled = false
        isEmergency = false
        ButtonIsPressed = false
        checkRequirements()
        safeButtonPressed = false


    }
    
    @IBAction func ClearButtonPressed(_ sender: UIBarButtonItem) {
        UrgencySlider.setValue(0, animated: false)
        urgency = 0
        UrgencyLabel.text = "Urgency: 0"
        SafeButton.backgroundColor = UIColor.green
        EmergencyButton.backgroundColor = UIColor.red
        UrgencySlider.isHidden = true
        UrgencySlider.isEnabled = false
        UrgencyLabel.isHidden = true
        UrgencyLabel.isEnabled = false
        DisasterPickerView.isHidden = true
        DisasterPickerView.isUserInteractionEnabled = false
        isEmergency = false
        ButtonIsPressed = false
        checkRequirements()
        safeButtonPressed = false

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SafeButton.backgroundColor = UIColor.green
        EmergencyButton.backgroundColor = UIColor.red
        UrgencySlider.isHidden = true
        UrgencySlider.isEnabled = false
        UrgencyLabel.isHidden = true
        UrgencyLabel.isEnabled = false
        DisasterPickerView.isHidden = true
        DisasterPickerView.isUserInteractionEnabled = false
        isEmergency = false
        checkRequirements()
        safeButtonPressed = false

    }
    
    func checkRequirements() {

        if (urgency != 0 || safeButtonPressed == true) && ButtonIsPressed == true && enteredNaturalDisaster != "" {
            SendButton.isHidden = false
            SendButton.isEnabled = true
        } else {
            SendButton.isHidden = true
            SendButton.isEnabled = false
        }
    }

}
