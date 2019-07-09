//
//  TCalendarContentsTableViewCell.swift
//  monolith
//
//  Created by Takahiro Ishitsuka  on 2019/07/07.
//  Copyright © 2019 Taka. All rights reserved.
//

import UIKit

class CalendarContentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(live: Live) {
        nameLabel.text = live.name
        placeLabel.text = live.place
    }
    
}
