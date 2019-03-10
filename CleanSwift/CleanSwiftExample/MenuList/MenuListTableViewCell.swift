//
//  MenuListTableViewCell.swift
//  CleanSwiftExample
//
//  Created by 최승환 on 2019. 3. 9..
//  Copyright © 2019년 최승환. All rights reserved.
//

import UIKit

class MenuListTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
