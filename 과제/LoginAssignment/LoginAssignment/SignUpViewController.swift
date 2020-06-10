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
    @IBOutlet weak var joinNameField: UITextField!
    @IBOutlet weak var joinEmailField: UITextField!
    @IBOutlet weak var joinPhoneField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        joinPwField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpSignUpButton(_ sender: Any) {
        
    guard let nextVC = self.storyboard?.instantiateViewController(identifier: "LogOutVC")as? LogOutViewController else { return  }
          
          nextVC.modalPresentationStyle = .fullScreen
        nextVC.idString = joinIdField.text!
        nextVC.pwString = joinPwField.text!
        self.present(nextVC, animated: true){
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func touchUpJoinButton(_ sender: Any) {
        
        guard let inputID = joinIdField.text else { return }
        guard let inputPWD = joinPwField.text else { return }
        guard let inputName = joinNameField.text else { return }
        guard let inputEmail = joinEmailField.text else { return }
        guard let inputPhone = joinPhoneField.text else { return }
        
        
        SignupService.shared.Signup(id: inputID, pwd: inputPWD, name: inputName, email: inputEmail, phone: inputPhone) { networkResult in
            switch networkResult {
            case .success(let sucessMessage):
                guard let sucessMessage = sucessMessage as? String else { return }
                
                
                print("회원 가입 성공")
                print("성공 메세지: \(sucessMessage)")
                
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
        
    }
}
