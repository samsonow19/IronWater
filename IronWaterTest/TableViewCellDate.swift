//
//  TableViewCellDate.swift
//  IronWaterTest
//
//  Created by админ on 21.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class TableViewCellDate: UITableViewCell, UIPickerViewDelegate {

    @IBOutlet weak var labelText: UILabel!
  
    @IBOutlet weak var dateTexteFild: UITextField!
    
    var pickerDateGender = UIDatePicker()

    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        NotificationCenter.default.addObserver(forName: UPDATE_DATE_TO_CELL_NOTIFICATION, object: nil, queue: nil) { (Notification) in
            self.editTextView.text = UserModel.sharedInstance.userBithday
        }*/
        pickerDateGender.addTarget(self, action: #selector(TableViewCellDate.didChangeDate(_:)), for: UIControlEvents.valueChanged)
        dateTexteFild.inputView = pickerDateGender
        self.pickerDateGender.datePickerMode = UIDatePickerMode.date
    }
    
    func didChangeDate(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier:"en_US_POSIX")
        let strDate = dateFormatter.string(from: pickerDateGender.date)
        UserModel.sharedInstance.userBithday = strDate
        dateTexteFild.text = strDate
    }

 

    


}
