//
//  TableViewCellUserEdit.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit


class TableViewCellUserEdit: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var editText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addDoneButtonOnKeyboard()
        editText.delegate = self
        updateModelUser()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateModelUser()
        let startHeight = textView.frame.size.height
        let calcHeight = textView.sizeThatFits(textView.frame.size).height  //iOS 8+ only
        if startHeight != calcHeight {
            NotificationCenter.default.post(Notification(name:ADD_HEIDHT_CELL_NOTIFICATION))
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        updateModelUser() // maybe dell
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(TableViewCellUserEdit.doneButtonAction))
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.editText.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        self.editText.resignFirstResponder()
    }
    
    func updateModelUser() {
        if labelText.text == "Имя" {
            UserModel.sharedInstance.userName = editText.text
        }
        if labelText.text == "Фамилия" {
            UserModel.sharedInstance.userSurname = editText.text
        }
        if labelText.text == "Отчество" {
            UserModel.sharedInstance.userPartronymic = editText.text
        }
        if labelText.text == "Дата Рождения" {
            UserModel.sharedInstance.userBithday = editText.text
        }
    }

}



