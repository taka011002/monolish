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
    
    private var live: Live!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(cellDidTapped(_:)))
        self.addGestureRecognizer(tapGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(live: Live) {
        self.live = live
        nameLabel.text = live.name
        placeLabel.text = live.place
    }
    
    @IBAction func cellDidTapped(_ sender: Any) {
        showDetail()
    }
    
    func showDetail() {
        let nextVC = R.storyboard.liveDetail.liveDetail()!
        nextVC.set(live: live)
        parentViewController()?.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
