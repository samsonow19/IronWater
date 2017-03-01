//
//  TabkeViewGender.swift
//  IronWaterTest
//
//  Created by админ on 19.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class TableViewGender: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var genderTextFild: UITextField!
    
    @IBOutlet weak var labelText: UILabel!

    var pickerGender = UIPickerView()

    var genderValue = ["Не указан","мужской","женский"]
    
    override func awakeFromNib() {
        
        pickerGender.delegate = self
        pickerGender.dataSource = self
        genderTextFild.delegate = self
        genderTextFild.inputView = self.pickerGender
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UserModel.sharedInstance.userGender = genderTextFild.text
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
        genderTextFild.text = genderValue[row]
      
    }

}
