//
//  LeapYearVC.swift
//  LeapYears
//
//  Created by CGP on 13/12/18.
//  Copyright © 2018 CGP. All rights reserved.
//

import UIKit

class LeapYearVC: UIViewController {
    
    
    @IBOutlet weak var txtFldYear: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSubmit.setBackgroundColor(.gray)
        self.btnSubmit.setRoundedBorder(btnSubmit)
        
    }
    
    
    @IBAction func btnSubmitClick(_ sender: UIButton) {
        
        guard let text = txtFldYear.text,   let number = Int(text) else {
            return
        }
        
        if (validateTextField(text: text)) {
            
            // Check if its leap year or not on valid input
            if (((number % 4 == 0 ) && (number % 100 != 0)) || (number % 400 == 0 )) {
                self.showAlert(vc: self, titleStr: "Alert!", messageStr: "It's a leap year!")
            }
            else
            {
                self.showAlert(vc: self, titleStr: "Alert!", messageStr: "Not a leap year!")
            }
        }
    }
    
    // Show Alert message
    func showAlert (vc: UIViewController, titleStr:String, messageStr:String) -> Void {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        { action -> Void in
            alert.dismiss(animated: true, completion: nil)
        })
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // Validate Text field value
    func validateTextField(text : String) -> Bool {
        if text.count < 4 || text.count > 4 || text.count == 0{
            self.showAlert(vc: self, titleStr: "Alert!", messageStr: "Please enter valid year!!")
            return false
        }
        else {
            return true
        }
    }
    
}


extension UIButton {
    
    // Set background color  to UIButton
    func setBackgroundColor(_ color : UIColor)  {
        self.backgroundColor = color
    }
    
    // Set rounded corner to UIButton
    func setRoundedBorder(_ button: UIButton)  {
        button.layer.cornerRadius = button.frame.size.height/2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        
    }
    
}


