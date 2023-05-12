//
//  String+Extension.swift
//  Demo
//
//  Created by Yogesh Tanwar on 11/05/23.
//

import Foundation

extension String {

    func isBlank() -> Bool {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let passwordPattern =
            // At least 8 characters +  At least one capital letter +  At least one lowercase letter + At least one digit +  At least one special character
            #"(?=.{8,})"# + #"(?=.*[A-Z])"# + #"(?=.*[a-z])"# + #"(?=.*\d)"# + #"(?=.*[ !$%&?._-])"#

        // "$tr0ngPa$$w0rd" matches passwordPattern,
        // so result is a Range<String.Index>
        let result = "$tr0ngPa$$w0rd".range(
            of: passwordPattern,
            options: .regularExpression
        )
        return (result != nil)
    }
}
