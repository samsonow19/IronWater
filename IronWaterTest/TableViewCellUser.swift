//
//  TableViewCellUser.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class TableViewCellUser: UITableViewCell {

    @IBOutlet weak var constLabel: UILabel!
    @IBOutlet weak var editLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
