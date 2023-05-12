//
//  RegisterViewController.swift
//  Demo
//
//  Created by Yogesh Tanwar on 12/05/23.
//

import UIKit
import GoogleSignIn

class RegisterViewController: UIViewController {

    let uncheck = "circle"
    let check = "circle.inset.filled"
    
    @IBOutlet weak var fNameField: UITextField!
    @IBOutlet weak var fNameLbl: UILabel!
    
    @IBOutlet weak var lNameField: UITextField!
    @IBOutlet weak var lNameLbl: UILabel!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var maleImg: UIImageView!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleImg: UIImageView!
    @IBOutlet weak var femaleBtn: UIButton!

    @IBOutlet weak var dobField: UITextField!
    @IBOutlet weak var dobLbl: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordBtn: UIButton!
    
    @IBOutlet weak var rePasswordField: UITextField!
    @IBOutlet weak var rePasswordLbl: UILabel!
    @IBOutlet weak var rePasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maleBtn.isSelected = true
        femaleBtn.isSelected = false
        labelsToBeHiddenAccordingToFields()
    }

    func labelsToBeHiddenAccordingToFields() {
        fNameLbl.isHidden = (self.fNameField.text ?? "").isBlank()
        lNameLbl.isHidden = (self.lNameField.text ?? "").isBlank()
        dobLbl.isHidden = (self.dobField.text ?? "").isBlank()
        emailLbl.isHidden = (self.emailField.text ?? "").isBlank()
        passwordLbl.isHidden = (self.passwordField.text ?? "").isBlank()
        rePasswordLbl.isHidden = (self.rePasswordField.text ?? "").isBlank()
    }
    
    
    // MARK: Validations
    
    func validationCheck() -> (Bool, String) {
        var valid = true
        var msg = ""
        if !((self.fNameField.text ?? "").isBlank()) {
            valid = false
            msg = "First Name cannot be blank"
        }
        if !((self.lNameField.text ?? "").isBlank()) {
            valid = false
            msg = "Last Name cannot be blank"
        }
        if !((self.dobField.text ?? "").isBlank()) {
            valid = false
            msg = "DOB cannot be blank"
        }
        if !((self.emailField.text ?? "").isValidEmail()) {
            valid = false
            msg = "Invalid Email"
        }
        if !((self.passwordField.text ?? "").isValidPassword()) {
            valid = false
            msg = "Incorrect Password"
        }
        if !((self.rePasswordField.text ?? "").isValidPassword()) {
            valid = false
            msg = "Incorrect Confirm Password"
        }
        if !((self.passwordField.text ?? "").elementsEqual((self.rePasswordField.text ?? ""))) {
            valid = false
            msg = "Password Mis-match"
        }
        return (valid, msg)
    }
    
    
    // MARK: Button Actions
    @IBAction func googleBtnTapped(_ sender: UIButton) {
        // same as in login screen
    }
    
    @IBAction func facebookBtnTapped(_ sender: UIButton) {
        // same as in login screen
    }
    
    @IBAction func genderBtnTapped(_ sender: UIButton) {
        maleBtn.isSelected = (sender == maleBtn)
        femaleBtn.isSelected = !maleBtn.isSelected

        maleImg.image = UIImage(systemName: maleBtn.isSelected ? check : uncheck)
        femaleImg.image = UIImage(systemName: femaleBtn.isSelected ? check : uncheck)
    }
    
    @IBAction func passwordBtnTapped(_ sender: UIButton) {
        if sender == passwordBtn {
            self.passwordField.isSecureTextEntry = !self.passwordBtn.isSelected
        } else {
            self.rePasswordField.isSecureTextEntry = !self.rePasswordBtn.isSelected
        }
    }
    
    @IBAction func goBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        let check = validationCheck()
        if check.0 == true {
            // validation pass
            // Api for registration
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // validation fail
            let msg = check.1
            self.displayAlert(msg, btn_title: "Ok")
        }
    }
}


extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        if textField == fNameField || textField == lNameField {
            if ((string.rangeOfCharacter(from: .letters) != nil) || (string.rangeOfCharacter(from: .whitespacesAndNewlines) != nil) || string.elementsEqual("")) {
                // add their new text to the existing text
                let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
                // make sure the result is under 30 characters
                return updatedText.count <= 30
            }
            return false
        }
        else if textField == passwordField || textField == rePasswordField{
            // add their new text to the existing text
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            // make sure the result is under 30 characters
            return updatedText.count <= 15
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        labelsToBeHiddenAccordingToFields()
    }
    
}
