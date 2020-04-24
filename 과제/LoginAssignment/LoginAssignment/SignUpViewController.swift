//
//  SignUpViewController.swift
//  LoginAssignment
//
//  Created by IJ . on 2020/04/24.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var joinIdField: UITextField!
    @IBOutlet weak var joinPwField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpSignUpButton(_ sender: Any) {
        
    guard let nextVC = self.storyboard?.instantiateViewController(identifier: "LogOutVC")as? LogOutViewController else { return  }
          
          nextVC.modalPresentationStyle = .fullScreen
        nextVC.idString = joinIdField.text
        nextVC.pwString = joinPwField.text
        self.present(nextVC, animated: true){
            self.navigationController?.popViewController(animated: true)
        }
    
    }

}
