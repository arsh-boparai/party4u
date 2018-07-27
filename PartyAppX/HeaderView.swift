//
//  HeaderView.swift
//  PartyAppX
//
//  Created by Arshdeep Singh on 2018-07-26.
//  Copyright © 2018 Arshdeep Singh. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 2
    }

}
