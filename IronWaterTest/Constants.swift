//
//  Constants.swift
//  IronWaterTest
//
//  Created by админ on 19.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import Foundation

struct UserModelEdit {
   
    var userName: String? = nil
    var userSurname: String? = nil
    var userPartronymic: String? = nil
    var userBithday : String? = nil
    var iserGender: String? = nil
}

var validateName = true
var validateSurname = true
var validatePartronymic = true
var validateBithday = true
var userModelEdit =  UserModelEdit()

let RELOAD_NOTIFICATION = Notification.Name(rawValue: "ReloadNotification ")
