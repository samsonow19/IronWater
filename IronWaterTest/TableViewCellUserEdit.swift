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
        self.addDoneButtonOnKeyboard()
        super.awakeFromNib()
        editText.delegate = self
     
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
        self.labelText.resignFirstResponder()
    }
    
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text  == "" {
            validDate = false
        }
        
        
        if labelText.text == "" {
          
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yy.MM.dd"
            var toDayDate = Date()
            
            let textFildDate = dateFormater.date(from: editText.text)
            
            if textFildDate! > toDayDate
            {
                validDate = false
            }
            
            
            
        }
        
    }
  

    

}
