//
//  TableViewCell.swift
//  PhoneBook
//
//  Created by Mike Laursen on 8/29/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
