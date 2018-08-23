//
//  PBTableViewCell.swift
//  PhotoBase
//
//  Created by Mike Laursen on 8/22/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class PBTableViewCell: UITableViewCell {
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
