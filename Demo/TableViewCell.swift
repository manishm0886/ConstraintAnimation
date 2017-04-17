//
//  TableViewCell.swift
//  Demo
//
//  Created by Manish Kumar on 4/9/17.
//  Copyright © 2017 Manish Kumar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var rightSpacingConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        rightSpacingConstraint.constant = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
