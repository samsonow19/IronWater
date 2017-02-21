//
//  TabkeViewGender.swift
//  IronWaterTest
//
//  Created by админ on 19.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class TableViewGender: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate{
    
    @IBOutlet weak var labelText: UILabel!
 
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var editTextView: UITextView!

    var genderValue = ["Не указан","мужской","женский"]
    
    override func awakeFromNib() {
        pickerView.delegate = self
        pickerView.dataSource = self
        editTextView.delegate = self
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UserModel.sharedInstance.userGender = editTextView.text
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderValue.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderValue[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        editTextView.text = genderValue[row]
        pickerView.isHidden  = true
        editTextView.isHidden = false
        UserModel.sharedInstance.userGender = editTextView.text
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView  == self.editTextView {
            editTextView.isHidden = true
            self.pickerView.isHidden = false
            editTextView.endEditing(true)
            print(editTextView.text)
        }
    }
    
    
    

}
