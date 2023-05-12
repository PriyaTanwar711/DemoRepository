//
//  ViewController.swift
//  Demo
//
//  Created by Yogesh Tanwar on 11/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordBtn.isSelected = false
        labelsToBeHiddenAccordingToFields()
    }
    
    func labelsToBeHiddenAccordingToFields() {
        emailLbl.isHidden = (self.emailField.text ?? "").isBlank()
        passwordLbl.isHidden = (self.passwordField.text ?? "").isBlank()
    }
    
    
    // MARK: Button Actions
    @IBAction func googleBtnTapped(_ sender: UIButton) {
        // Google login methods
        // Integrate Firebase SDK and import and apply open url methods in application
        // and apply google sign in url after configuring firebase
        // and reverse_Client id in url types in info.plist in project target
    }
    
    @IBAction func facebookBtnTapped(_ sender: UIButton) {
        // facebook login methods
        // Integrate Facebook sdk and import in application and apply its config url in it
        // apply its delegate methods where you are using and add api key in url types in info.plist in project target
    }
    
    @IBAction func passwordBtnTapped() {
        self.passwordField.isSecureTextEntry = !self.passwordBtn.isSelected
    }

    @IBAction func loginButtonTapped() {
        
        let check = validationCheck()
        if check.0 == true {
            // validation correct
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(vc, animated: true)

        } else {
            // validation fail
            let msg = check.1
            self.displayAlert(msg, btn_title: "Ok")
        }
    }
    
    @IBAction func registerButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    // MARK: Validations
    
    func validationCheck() -> (Bool, String) {
        var valid = true
        var msg = ""
        if !((self.emailField.text ?? "").isValidEmail()) {
            valid = false
            msg = "Invalid Email"
        }
        if !((self.passwordField.text ?? "").isValidPassword()) {
            valid = false
            msg = "Incorrect Password"
        }
        return (valid, msg)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        labelsToBeHiddenAccordingToFields()

    }
    
}

