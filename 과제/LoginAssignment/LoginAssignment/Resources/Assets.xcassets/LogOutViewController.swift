//
//  LogOutViewController.swift
//  LoginAssignment
//
//  Created by IJ . on 2020/04/24.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    
    @IBOutlet weak var logIdTextField: UITextField!
    @IBOutlet weak var logPwTextField: UITextField!
    
    var idString: String?
    var pwString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTextField()
        
       logPwTextField.isSecureTextEntry = true
        
    }
    func fillTextField(){
          if let id = idString {
              logIdTextField.text = id
          }
          if let pw = pwString {
              logPwTextField.text = pw
          }
          logIdTextField.isEnabled = false
          logPwTextField.isEnabled = false

      }
    
    @IBAction func touchUpLogOutButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: {})
        
    }
    
    
}
