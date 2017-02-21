//
//  TableCellDate.swift
//  IronWaterTest
//
//  Created by админ on 21.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class TableCellDate: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func changeDate(_ sender: Any) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier:"en_US_POSIX")
        let strDate = dateFormatter.string(from: datePicker.date)
        UserModel.sharedInstance.userBithday = strDate
        NotificationCenter.default.post(Notification(name:HIDE_SHOW_CELL_WITH_DATE_PICKER))
    }
}
