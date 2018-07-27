//
//  MessageCell.swift
//  PartyAppX
//
//  Created by Arshdeep Singh on 2018-07-26.
//  Copyright © 2018 Arshdeep Singh. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    func configureCell(user: String, message: String) {
        userLabel.text = user
        messageLabel.text = message
    }

}
