//
//  UserCell.swift
//  Flix
//
//  Created by Milana Stetsenko on 9/21/20.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var NameCell: UILabel!

    @IBOutlet weak var PosterView: UIImageView!
    @IBOutlet weak var DescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
