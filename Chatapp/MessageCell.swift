//
//  MessageCell.swift
//  Chatapp
//
//  Created by Mac on 31/05/20.
//  Copyright © 2020 Akash. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var msgbackground: UIView!
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var sendername: UILabel!
    @IBOutlet weak var messageLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
