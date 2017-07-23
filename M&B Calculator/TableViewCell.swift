//
//  TableViewCell.swift
//  M&B Calculator
//
//  Created by Sander Haug on 22/07/2017.
//  Copyright © 2017 Sander Haug. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var acType: UILabel!
    @IBOutlet weak var acReg: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
