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
        logInButton.layer.cornerRadius = 10
        logOutButton.layer.cornerRadius = 10
        
        
        pwTextField.isSecureTextEntry = true
        
    }
    
    @IBAction func touchUpLogInButton(_ sender: Any) {
        //원래 Navigation loginfunc
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "LogOutVC")as? LogOutViewController else { return  }
        nextVC.modalPresentationStyle = .currentContext
        
        nextVC.idString = idTextField.text!
        nextVC.pwString = pwTextField.text!
        self.present(nextVC, animated: true, completion: {
            self.pwTextField.text = ""
        })
        
    }
    
    @IBAction func touchUpServerLogin(_ sender: Any) {
        
        
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "customTabbarController") as? UITabBarController else { return }
                
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                print("로그인성공")
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message,
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
    
    
    @IBAction func touchUpSignUp(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignUpVC")as? SignUpViewController else { return  }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}



extension UIButton {
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        if self.tag == 1{
            self.layer.cornerRadius = 10
        }
    }
}

