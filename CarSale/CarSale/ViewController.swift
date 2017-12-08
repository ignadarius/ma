//
//  ViewController.swift
//  CarSale
//
//  Created by Darius Igna on 11/1/17.
//  Copyright © 2017 Darius Igna. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController,MFMailComposeViewControllerDelegate ,UITextFieldDelegate{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.black.cgColor
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func sendEmail(text: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([emailTextField.text!])
            mail.setMessageBody(text, isHTML: true)
            
            UIApplication.shared.keyWindow?.rootViewController?.present(mail,animated: true)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Mail not available", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    internal func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }


    @IBAction func signupButtonPressed(_ sender: Any) {
        sendEmail(text: "Hey" + usernameTextField.text! + ", welcome to CarSale")
        self.dismiss(animated: true, completion: nil)
        
    }

}

