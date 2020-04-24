//
//  ViewController.swift
//  LoginAssignment
//
//  Created by IJ . on 2020/04/24.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpLogInButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "LogOutVC")as? LogOutViewController else { return  }
        nextVC.modalPresentationStyle = .currentContext
        
        nextVC.idString = idTextField.text
        nextVC.pwString = pwTextField.text
        self.present(nextVC, animated: true, completion: {
            self.pwTextField.text = ""
        })
        
    }
    @IBAction func touchUpSignUp(_ sender: Any) {
         guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignUpVC")as? SignUpViewController else { return  }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}

