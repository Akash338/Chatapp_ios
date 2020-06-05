//
//  ViewController.swift
//  Chatapp
//
//  Created by Mac on 29/05/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var PassTF: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func LoginBT(_ sender: UIButton) {
        login()
    }
    func login(){
        Auth.auth().signIn(withEmail: emailTF.text!, password: PassTF.text!) { (data, error) in
            if error != nil {
                print("login error")
            }else{
                print("sucess")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                self.navigationController?.navigationBar.isHidden = false
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

