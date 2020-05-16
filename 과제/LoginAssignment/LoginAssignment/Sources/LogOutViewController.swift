//
//  LogOutViewController.swift
//  LoginAssignment
//
//  Created by IJ . on 2020/05/16.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

    @IBOutlet weak var idtextField: UITextField!
    @IBOutlet weak var pwtextField: UITextField!
    
    var idString: String = ""
    var pwString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idtextField.text = idString
        pwtextField.text = pwString
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpLogOutButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
