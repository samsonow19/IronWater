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
    
    var validDate = true

    override func awakeFromNib() {
        
        super.awakeFromNib()

        self.addDoneButtonOnKeyboard()
        editText.delegate = self
        
        // Initialization code
        /*NotificationCenter.default.addObserver(forName: VALIDATE_NOTIFICATION, object: nil, queue: nil) { (Notification) in

        }*/
        
        
    }
 
    func textViewDidChange(_ textView: UITextView) {
         self.validDateUser()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        validDateUser()
       
        // Configure the view for the selected state
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
    
    
    
    func validDateUser() {
      
        if labelText.text == "Имя" {
            validateName = checkValid(textViewEdit: editText.text)
            userModelEdit.userName = editText.text
            print(editText.text)
        }
        if labelText.text == "Фамилия" {
            validateSurname = checkValid(textViewEdit: editText.text)
            userModelEdit.userSurname = editText.text
        }
        if labelText.text == "Отчество" {
            validatePartronymic = checkValid(textViewEdit: editText.text)
            userModelEdit.userPartronymic = editText.text
        }
        if labelText.text == "Дата Рождения" {
            validateBithday = checkValid(textViewEdit: editText.text)
            userModelEdit.userBithday = editText.text
            if validateBithday == true {
                validateBithday = checkValidDate(textViewEdit: editText.text)
                
            }
        }
       
        
    }
    
 
    
    func checkValid(textViewEdit: String) ->Bool {
        
        if textViewEdit  == "" {
             return false
        }
     
        return true
        
    }
    
    func checkValidDate(textViewEdit: String) ->Bool {

        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier:"en_US_POSIX")
        let datecomponents = dateFormatter.date(from: editText.text)
        print(editText.text)
        let now = Date()
            
        if (datecomponents! > now) {
            return false
        } else {
            return true
        }   
        }
}



