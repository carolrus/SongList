//
//  SongTableViewCell.swift
//
//  Class to hold UI elements of a cell in table view
//
//  Created by C Rus on 10/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bandLabel: UILabel!
    @IBOutlet var songImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
