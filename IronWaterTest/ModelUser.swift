//
//  ModelUser.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import Foundation
//import Realm
import RealmSwift

class ModelUser : Object{
    
    dynamic var idUser = 0
    dynamic var userName: String? = nil
    dynamic var userSurname: String? = nil
    dynamic var userPartronymic: String? = nil
    dynamic var userBithday : String? = nil
    dynamic var iserGender: String? = nil
    
    override static func primaryKey() -> String? {
        return "idUser"
    }
}
