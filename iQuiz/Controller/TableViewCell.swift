//
//  TableViewCell.swift
//  iQuiz
//
//  Created by Austin Brovick  on 11/10/17.
//  Copyright © 2017 Austin Brovick . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var quizImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
