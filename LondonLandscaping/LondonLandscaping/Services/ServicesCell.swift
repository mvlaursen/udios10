//
//  ServiceTableViewCell.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/3/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ServicesCell: UITableViewCell {
    @IBOutlet public weak var cellImageView: UIImageView!
    @IBOutlet public weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
