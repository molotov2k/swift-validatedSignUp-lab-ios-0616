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
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        textFieldShouldReturn(textField)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        let moreThanZero = textField.text?.characters.count > 0
        
        switch textField {
            
        case firstTextField:
            
            if let firstNameText = firstTextField.text{
                
                if moreThanZero && hasDigits(firstNameText){
                    
                    lastNameTextField.enabled = true
                    lastNameTextField.becomeFirstResponder()
                    
                }else{
                    
                    let alert = UIAlertView.init(title: "Validation Error", message: <#T##String#>, delegate: <#T##UIAlertViewDelegate?#>, cancelButtonTitle: <#T##String?#>, otherButtonTitles: <#T##String#>, <#T##moreButtonTitles: String...##String#>)
//                    
//                    UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"First Name must have more than 0 characters and no numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
                    //    [newAlert show];

                    
                }
            }
            
        case lastNameTextField:
            
            if let lastNameText = lastNameTextField.text{
                
                if moreThanZero && hasDigits(lastNameText){
                    
                    emailTextField.enabled = true
                    
                }else{
                    
                    
                    
                }
            }
            
            
        case emailTextField:
            
            if let emailText = emailTextField.text{
                
                if moreThanZero && hasDigits(emailText){
                    
                    userNameTextField.enabled = true
                    
                }else{
                    
                    
                    
                }
            }
            
            
        case userNameTextField:
            
            if let userNameText = userNameTextField.text{
                
                if moreThanZero && hasDigits(userNameText){
                    
                    passwordTextField.enabled = true
                    
                }else{
                    
                    
                    
                }
            }
            
            
        case passwordTextField:
            
            if let passwordText = passwordTextField.text{
                
                if moreThanZero && hasDigits(passwordText){
                    
                    submitButton.enabled = true
                    
                }else{
                    
                    
                    
                }
            }
            
        default:
            
            <#code#>
        }
    }
    
    func hasDigits(string: String) -> Bool{
        
        // return [input rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound;
        
    }
    

//    //    }
//    }
//    else if (textField == self.lastName)
//    {
//    if ([textField.text length]>0 && ![self hasDigits:textField.text]) {
//    self.email.enabled = YES;
//    [self.email becomeFirstResponder];
//    } else
//    {
//    self.selectedTextField=textField;
//    UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"Last Name must have more than 0 characters and no numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
//    [newAlert show];
//    }
//    }
//    else if (textField == self.email)
//    {
//    if ([textField.text length]>0 && [self validateEmail:textField.text]) {
//    self.userName.enabled = YES;
//    [self.userName becomeFirstResponder];
//    } else
//    {
//    self.selectedTextField=textField;
//    UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"Email must have more than 0 characters and be a valid format" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
//    [newAlert show];
//    }
//    }
//    else if (textField == self.userName)
//    {
//    if ([textField.text length]>0 && ![self hasDigits:textField.text]) {
//    self.password.enabled = YES;
//    [self.password becomeFirstResponder];
//    } else
//    {
//    self.selectedTextField=textField;
//    UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"username must have more than 0 characters and no numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
//    [newAlert show];
//    }
//    }
//    else if (textField == self.password)
//    {
//    if ([textField.text length]>6) {
//    self.submitButton.enabled = YES;
//    } else
//    {
//    self.selectedTextField=textField;
//    UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"password must have more than 6 characters" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
//    [newAlert show];
//    }
//    }
//    return YES;
//    }


}

