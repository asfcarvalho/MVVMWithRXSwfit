//
//  PeopleTableViewCell.swift
//  MVVMRxSwift
//
//  Created by asfcarvalho on 24/10/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var hightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ teste: String) {
        nameLabel.text = teste
    }
}
