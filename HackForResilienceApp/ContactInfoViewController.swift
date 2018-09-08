//
//  ContactInfoViewController.swift
//  HackForResilienceApp
//
//  Created by Arya Tschand on 9/8/18.
//  Copyright © 2018 Manan Saaraswat. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController {

    var contactArray = [Contact]()
    var contact: Contact!
    var contactIndex: Int = 0
    var integerPhoneNumber: String = ""
    var stringPhoneNumber: String = ""
    var name: String = ""
    var tenDigitsReached: Bool = false
    var previousCharacterCount: Int = 0
    var testString: String = ""
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Contacts.plist")
    var willDisappear: Bool = false

    override func viewWillAppear(_ animated: Bool) {
        SaveContacts()
        print(contactArray[0])
        if contactArray[contactIndex].name != "" {
            NameInput.text = contactArray[contactIndex].name
            NameLabel.text = "Name (Compelete)"
            NameLabel.textColor = UIColor.green
        }
        if contactArray[contactIndex].displayPhoneNumber != "" {
            NumberInput.text = contactArray[contactIndex].displayPhoneNumber
            NumberLabel.text = "Phone Number (Compelete)"
            NumberLabel.textColor = UIColor.green
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.textColor = UIColor.red
        NumberLabel.textColor = UIColor.red

    }
    
    @IBOutlet weak var NameInput: UITextField!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var NumberInput: UITextField!
    
    @IBOutlet weak var NumberLabel: UILabel!
    @IBAction func NameChanged(_ sender: Any) {
        if willDisappear == false {
            name = NameInput.text!
            contactArray[contactIndex].name = name
        }
        if NameInput.text != "" {
            NameLabel.text = "Name (Compelete)"
            NameLabel.textColor = UIColor.green
        }else {
            NameLabel.text = "Name (Incomplete)"
            NameLabel.textColor = UIColor.red
        }
        print(contactIndex)
        print(contactArray[contactIndex].name)
        SaveContacts()
    }
    
    @IBAction func NumberChanged(_ sender: UITextField) {
    
    
    if tenDigitsReached == false {
//        if (NumberInput.text?.count)! > 1 {
//            if String(NumberInput.text!.last!) != "-" {
//                numberArray.append(Int(String(NumberInput.text!.last!))!)
//            }
//        }
        
            stringPhoneNumber = NumberInput.text!
            if (stringPhoneNumber.count == 3 || stringPhoneNumber.count == 7) && (NumberInput.text?.count)! > previousCharacterCount{
                stringPhoneNumber = "\(stringPhoneNumber)-"
                NumberInput.text = stringPhoneNumber
            }
            
        } else if tenDigitsReached == true{
        }
        if (NumberInput.text?.count)! >= 12 {
            tenDigitsReached = true
            NumberInput.text = stringPhoneNumber
            NumberLabel.text = "Phone Number (Compelete)"
            NumberLabel.textColor = UIColor.green
        } else {
            tenDigitsReached = false
            NumberLabel.text = "Phone Number (Incomplete)"
            NumberLabel.textColor = UIColor.red
        }
        previousCharacterCount = (NumberInput.text?.count)!
        testString = stringPhoneNumber
        if let range = testString.range(of: "-") {
            testString.removeSubrange(range)
            integerPhoneNumber = testString
        }
        if let range = testString.range(of: "-") {
            testString.removeSubrange(range)
            integerPhoneNumber = testString
        }
        contactArray[contactIndex].phoneNumber = integerPhoneNumber
        contactArray[contactIndex].displayPhoneNumber = stringPhoneNumber
    SaveContacts()
    }
    override func viewWillDisappear(_ animated: Bool) {
        if contactArray[contactIndex].name == "" || contactArray[contactIndex].phoneNumber == "" {
            contactArray[contactIndex].phoneNumber = "remove"
            print("removed")
        }
        SaveContacts()
        willDisappear = true
    }
    func SaveContacts() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(contactArray)
            try data.write(to: dataFilePath!)
            
        } catch {
            print("Error encoding team array, \(error)")
        }
        
    }
    
}
