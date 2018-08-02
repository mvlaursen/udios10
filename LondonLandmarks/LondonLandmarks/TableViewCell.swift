//
//  TableViewCell.swift
//  LondonLandmarks
//
//  Created by Mike Laursen on 8/2/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet public weak var cellImageView: UIImageView!
    @IBOutlet public weak var cellTitle: UILabel!
    @IBOutlet public weak var cellDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
