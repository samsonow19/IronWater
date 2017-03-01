//
//  UserModel.swift
//  IronWaterTest
//
//  Created by админ on 20.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import Foundation
enum UserGender: String{
    case NotGender = "Не указан"
    case ManGender = "Мужчина"
    case WomenGender = "Женщина"
}
class UserModel : NSObject {
    
    var userName: String? = nil
    var userSurname: String? = nil
    var userPartronymic: String? = nil
    var userBithday : String? = nil
    var userGender: String? = nil
 
    static let sharedInstance = UserModel()
    
    func myValidate() -> Bool {
      
        if userName  == "" {
            return false
        }
        if userSurname  == "" {
            return false
        }
        if userPartronymic  == "" {
            return false
        }
        if userGender == "Не указан" {
            return false
        }
        if !myValidateDate(testDate: userBithday!) {
           return false
        }
        return true
    }
    
    func myValidateDate(testDate: String)->Bool {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier:"en_US_POSIX")
        let datecomponents = dateFormatter.date(from: testDate)
        print(testDate)
        if datecomponents == nil {
            return false
        }
        let now = Date()
        if (datecomponents! > now) {
            return false
        } else {
            return true
        }
    }
    
    func modelFromArray(array: [NSString]) {
        userName = array[0] as String
        userSurname = array[1] as String
        userPartronymic = array[2] as String
        userBithday  = array[3] as String
        userGender = array[4] as String
    }
    
    func saveUserModel() {
        let userDateDafaults  = UserDefaults.standard
        var userDate = [String]()
        userDate.append(userName!)
        userDate.append(userSurname!)
        userDate.append(userPartronymic!)
        userDate.append(userBithday!)
        userDate.append(userGender!)
        userDateDafaults.set(userDate, forKey: "UserList")
        userDateDafaults.synchronize()
  
    }
    
    func dataChanged()->Bool {
        let userDateDafaults  = UserDefaults.standard
        var userDate = userDateDafaults.object(forKey: "UserList") as! [String]
        if userDate[0] != userName {
            return true
        }
        if userDate[1] != userSurname {
            return true
        }
        if userDate[2] != userPartronymic {
            return true
        }
        if userDate[3] != userBithday {
            return true
        }
        if userDate[4] != userGender {
            return true
        }
        return false
    }

}
