//
//  ViewController.swift
//  ValidatedSignUp
//
//  Created by Flatiron School on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    
    var validFields = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    
//# MARK: TextField methods
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var resultingText: NSString = ""
        
        if let text = textField.text {
            resultingText = text
        }
    
        resultingText = resultingText.stringByReplacingCharactersInRange(range, withString: string)
        
        self.validateTextField(textField, text: resultingText as String)

        return true
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField.backgroundColor == UIColor.redColor() {
            
            self.presentAlert("Something is wrong", message: "Please correct mistakes before procceeding", textField: textField)
            
        } else {
            
            self.validFields += 1
            if self.validFields == self.textFields.count {
                self.presentAlert("You can now submit", message: "Good job!", textField: nil)
                self.submitButton.hidden = false
                self.submitButton.enabled = true
            }
            
            let currentTextFieldIndex = self.activeTextFieldIndex(textField)
            var nextTextFieldIndex = 0
            
            if currentTextFieldIndex != self.textFields.count - 1 {
                nextTextFieldIndex = currentTextFieldIndex + 1
            }
            
            textField.resignFirstResponder()
            textField.enabled = false
            
            self.textFields[nextTextFieldIndex].enabled = true
            self.textFields[nextTextFieldIndex].becomeFirstResponder()
            
        }
        
        return true
    }
    
    
//# MARK: Submit method
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        self.presentAlert("Submit successfull", message: "Thank you for submitting your data. \nExecution squad will contact you shortly!", textField: nil)
        initialSetup()
    }
    
    
//# MARK: Setup and helper methods
    
    func initialSetup() {
        for textField in self.textFields {
            textField.delegate = self
            textField.text?.removeAll()
            textField.backgroundColor = UIColor.whiteColor()
            if textField.placeholder == "First Name" {
                textField.becomeFirstResponder()
            }
        }
        self.submitButton.hidden = true
    }
    
    
    func activeTextFieldIndex(activeTextField: UITextField) -> Int {
        for (index, textField) in self.textFields.enumerate() {
            if activeTextField.placeholder == textField.placeholder {
                return index
            }
        }
        return 0
    }
    
    func validateTextField(textField: UITextField, text: String) {
        var validField = false
        
        if let placeholder = textField.placeholder {
            
            switch placeholder {
                
            case "First Name", "Last Name", "User Name":
                let digitChars = text.characters.filter({Int(String($0)) != nil })
                
                if text.characters.count > 0 && digitChars.isEmpty {
                    validField = true
                }
                
            case "Password":
                if text.characters.count > 6 {
                    validField = true
                }
                
            case "Email Address":
                if text.characters.contains("@") && text.characters.contains(".") {
                    validField = true
                }
                
            default:
                print("Add the new text field to Validate Text Field cases!")
            }
        }
        
        if validField {
            textField.backgroundColor = UIColor.greenColor()
        } else {
            textField.backgroundColor = UIColor.redColor()
        }
    }
    

//# MARK: Alert constructor
    
    func presentAlert(title: String, message: String, textField: UITextField?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        if let textField = textField {
            let dismissAlertAction = UIAlertAction(title: "Clear", style: .Default, handler: {
                (action) in
                textField.text?.removeAll()
            })
            alertController.addAction(dismissAlertAction)
        }
        
        let okAlertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(okAlertAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}