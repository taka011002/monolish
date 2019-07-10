//
//  CalendarViewController.swift
//  monolith
//
//  Created by Takahiro Ishitsuka  on 2019/07/07.
//  Copyright © 2019 Taka. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let dateFormatter = DateFormatter()
    private var selectedDate: String! {
        didSet {
            
            tableView.reloadData()
        }
    }
    
    private var lives: [Live]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        lives = LiveRepository.selectAll()
        
        tableView.register(UINib(resource: R.nib.calendarContentsTableViewCell), forCellReuseIdentifier: R.nib.calendarContentsTableViewCell.name)
        
        selectedDate = dateFormatter.string(from: Date())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        selectedDate = dateFormatter.string(from: date)
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int{
        if Array(lives.map{$0.date}.joined()).contains(dateFormatter.string(from: date)) {
            return 1
        } else {
            return 0
        }
    }
}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lives.filter{ $0.date.contains(selectedDate)}.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.calendarContentsTableViewCell.name) as! CalendarContentsTableViewCell
        let live = lives.filter{ $0.date.contains(selectedDate)}[indexPath.row]
        cell.set(live: live)
        
        return cell
    }
        
}
