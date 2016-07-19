//
//  ViewController.swift
//  ValidatedSignUp
//
//  Created by Flatiron School on 7/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastNameTextField.delegate = self
        passwordTextField.delegate = self
        userNameTextField.delegate = self
        emailTextField.delegate = self
        firstTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        let moreThanZero = textField.text?.characters.count > 0
        
        switch textField {
            
        case firstTextField:
            
            if let firstNameText = firstTextField.text{
                
                if moreThanZero && !hasDigits(firstNameText){
                    
                    lastNameTextField.enabled = true
                    lastNameTextField.becomeFirstResponder()
                    
                }else{
                    
                    showAlert(firstTextField)
                    lastNameTextField.enabled = false
                    submitButton.enabled = false
                }
            }
            
        case lastNameTextField:
            
            if let lastNameText = lastNameTextField.text{
                
                if moreThanZero && !hasDigits(lastNameText){
                    
                    emailTextField.enabled = true
                    emailTextField.becomeFirstResponder()
                    
                }else{
                    
                    showAlert(lastNameTextField)
                    emailTextField.enabled = false
                    submitButton.enabled = false
                }
            }
            
            
        case emailTextField:
            
            if let emailText = emailTextField.text{
                
                if moreThanZero && validateEmail(emailText){
                    
                    userNameTextField.enabled = true
                    userNameTextField.becomeFirstResponder()
                    
                }else{
                    
                    
                    showAlert(emailTextField)
                    userNameTextField.enabled = false
                    submitButton.enabled = false
                }
            }
            
        case userNameTextField:
            
            if let userNameText = userNameTextField.text{
                
                if moreThanZero && !hasDigits(userNameText){
                    
                    
                    passwordTextField.enabled = true
                    passwordTextField.becomeFirstResponder()
                    
                }else{
                    
                    showAlert(userNameTextField)
                    passwordTextField.enabled = false
                    submitButton.enabled = false
                }
            }
            
        case passwordTextField:
            
            if let passwordText = passwordTextField.text{
                
                if passwordText.characters.count > 6 && hasDigits(passwordText){
                    
                    submitButton.enabled = true
                    firstTextField.becomeFirstResponder()
                    
                    UIView.animateWithDuration(0.25, animations: {
                        
                        self.submitButton.titleLabel?.textColor = UIColor.blueColor()
                        self.loadViewIfNeeded()
                    })
                    
                }else {
                    submitButton.enabled = false
                }
            }
            
        default:
            
            break
        }
        
        return true
    }
    
    func hasDigits(string: String) -> Bool{
        
        let decimalChars = NSCharacterSet.decimalDigitCharacterSet()
        let decimalRange = string.rangeOfCharacterFromSet(decimalChars)
        
        if decimalRange != nil {

            return true
        }

        return false
    }
    
    func showAlert(textfield: UITextField){
        
        
        let alert = UIAlertController(title: "Invalid Entry", message: "Please Enter A Valid Entry", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Clear", style: UIAlertActionStyle.Cancel, handler: { (action) in
            
            textfield.text?.removeAll()
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func validateEmail(text: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluateWithObject(text)
    }
}

