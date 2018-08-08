//
//  SocialCell.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/7/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class SocialCell: UITableViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellLabel.textColor = Colors.gardenGreen
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
