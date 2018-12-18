//
//  ViewController.swift
//  test
//
//  Created by Camille Vandenbussche on 29/10/2018.
//  Copyright © 2018 Camille Vandenbussche. All rights reserved.
//

import UIKit
import MessageUI


class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var messageField: UITextField!
   

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func send(_ sender: Any) {
        //email conny
        let toRecipients = ["camille.vandenb@gmail.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate=self
        mc.setToRecipients(toRecipients)
        mc.setSubject("Uren lesgegeven")
        
        mc.setMessageBody("Name: \(nameField.text!), \n\nMessage: \(messageField.text!)", isHTML: false)
        
        self.present(mc,animated: true,completion:nil)
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
            
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
            
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
            
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
            
        default:
            break;
        }
        
        self.dismiss(animated: true,completion: nil)
        
    }
    
    
    
    
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }
}

