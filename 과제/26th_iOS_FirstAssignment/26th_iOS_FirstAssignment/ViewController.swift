//
//  ViewController.swift
//  26th_iOS_FirstAssignment
//
//  Created by IJ . on 2020/04/24.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpRedButton(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RedVC") as? RedViewController else { return  }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}

