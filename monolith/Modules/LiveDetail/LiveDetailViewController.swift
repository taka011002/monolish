//
//  LiveDetailViewController.swift
//  monolith
//
//  Created by Takahiro Ishitsuka  on 2019/07/07.
//  Copyright © 2019 Taka. All rights reserved.
//

import UIKit

class LiveDetailViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var live: Live!
    
    private var headerHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerHeight = mainImageView.frame.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isClearNavigationBar(true)
        
        mainImageView.image = live.mainImage
        mainTitleLabel.text = live.name
        placeLabel.text = live.place
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isClearNavigationBar(false)
    }
    
    @IBAction func officialHomePageButtonTapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: live.officialSiteURL)!, options: [:], completionHandler: nil)
    }
    
    private func isClearNavigationBar(_ crear: Bool) {
        if crear {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            navigationController?.navigationBar.shadowImage = nil
        }
    }
    
    func set(live: Live) {
        self.live = live
    }
    
}

extension LiveDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            let y = scrollView.contentOffset.y
            mainImageView.frame = CGRect(x: scrollView.contentOffset.y, y: 0+scrollView.contentOffset.y, width: UIScreen.main.bounds.size.width - 2 * y, height: headerHeight - y)
        }
        
        if headerHeight < scrollView.contentOffset.y {
            isClearNavigationBar(false)
            navigationItem.title = live.name
        } else {
            isClearNavigationBar(true)
            navigationItem.title = ""
        }
        
    }
    
}
