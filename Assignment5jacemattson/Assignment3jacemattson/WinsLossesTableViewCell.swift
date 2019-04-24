//
//  WinsLossesTableViewCell.swift
//  Assignment3jacemattson
//
//  Created by Jace Mattson on 2019-04-24.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class WinsLossesTableViewCell: UITableViewCell {

    @IBOutlet weak var average: UILabel!
    @IBOutlet weak var losses: UILabel!
    @IBOutlet weak var wins: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
