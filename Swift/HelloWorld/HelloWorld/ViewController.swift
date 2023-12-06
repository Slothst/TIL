//
//  ViewController.swift
//  HelloWorld
//
//  Created by 최낙주 on 12/4/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: Any) {
        lblHello.text = "Hello, " + txtName.text!
    }
    
}

