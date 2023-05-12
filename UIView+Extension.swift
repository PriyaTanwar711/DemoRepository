//
//  UIView+Extension.swift
//  Demo
//
//  Created by Yogesh Tanwar on 11/05/23.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor ?? .init(gray: 1, alpha: 0))
        }
    }
    
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or its top view is of the wrong type
            return nil
        }

        self.addSubview(contentView)
        return contentView
    }
}

extension UIViewController {
    func displayAlert(_ msg: String, btn_title: String) {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btn_title, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
