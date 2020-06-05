//
//  HomeViewController.swift
//  Chatapp
//
//  Created by Mac on 29/05/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource ,UITextFieldDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var messageTF: UITextField!
    @IBAction func SendBT(_ sender: UIButton) {
        send()
    }
    
    var messageArray = [Model]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Recive()
        tableview.separatorStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MessageCell
        cell.msgbackground.layer.cornerRadius = 18
        cell.messageLBL.text = messageArray[indexPath.row].Massage
        cell.sendername.text = messageArray[indexPath.row].Sender
        
        if cell.sendername.text == Auth.auth().currentUser?.email! {
            
            //Set background to blue if message is from logged in user.
            cell.userimage.backgroundColor = UIColor.flatMint()
            cell.msgbackground.backgroundColor = UIColor.flatSkyBlue()
            
        } else {
            
            //Set background to grey if message is from another user.
            cell.userimage.backgroundColor = UIColor.flatWatermelon()
            cell.msgbackground.backgroundColor = UIColor.flatGray()
        }
        return cell
    }
    
    func send(){
        let db = Database.database().reference().child("chatapp")
        
        let messagedb = ["Sender": Auth.auth().currentUser?.email , "message":messageTF.text!]
        
        db.childByAutoId().setValue(messagedb){
            (error , refrance) in
            if error != nil{
                print("error")
            }else{
                print("Succes")
            }
        }
        
    }
    
    func Recive(){
        let db = Database.database().reference().child("chatapp")
        db.observe(.childAdded) { (snap) in
            let snapvalue = snap.value as! Dictionary<String,String>
            let text = snapvalue["message"]!
            let sender = snapvalue["Sender"]!
            
            let msg = Model()
            msg.Massage = text
            msg.Sender = sender
            
            self.messageArray.append(msg)
            self.tableview.reloadData()
        }
    }
}

