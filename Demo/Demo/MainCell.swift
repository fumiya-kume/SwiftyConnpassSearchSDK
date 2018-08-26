//
//  MainCell.swift
//  
//
//  Created by 久米史也 on 2018/08/26.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var EventNumber: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
