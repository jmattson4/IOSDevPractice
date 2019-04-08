//
//  TeamTableViewCell.swift
//  CustomTableViewCellDemo
//
//  Created by Jace Mattson on 2019-03-13.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell
{

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var gpLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!
    @IBOutlet weak var otLabel: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
    
    super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
