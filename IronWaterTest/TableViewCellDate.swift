//
//  TableViewCellDate.swift
//  IronWaterTest
//
//  Created by админ on 21.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class TableViewCellDate: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var editTextView: UITextView!

    override func awakeFromNib() {
        
        NotificationCenter.default.addObserver(forName: UPDATE_DATE_TO_CELL_NOTIFICATION, object: nil, queue: nil) { (Notification) in
            self.editTextView.text = UserModel.sharedInstance.userBithday
        }
        editTextView.delegate = self
        super.awakeFromNib()
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView  == self.editTextView {
            NotificationCenter.default.post(Notification(name:HIDE_SHOW_CELL_WITH_DATE_PICKER))
            editTextView.endEditing(true)
        }
    }
    


}
