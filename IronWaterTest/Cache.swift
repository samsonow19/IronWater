//
//  Cache.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import Foundation
//import Realm
import RealmSwift
class Cache {
    static func UpdateUser(user: ModelUser ){
        let realm = try! Realm()
        do{
            user.idUser = 0
       
            try! realm.write {
                
                realm.add(user, update: true)
            }
        }
       
    
    }
    
    static func UpdateUserEdit() {
        
    let realm = try! Realm()
    do {

        let user = ModelUser()
        print(userModelEdit)
        user.iserGender = userModelEdit.iserGender
        user.userBithday  = userModelEdit.userBithday
        user.userName = userModelEdit.userName
        user.userPartronymic = userModelEdit.userPartronymic
        user.userSurname = userModelEdit.userSurname
        try! realm.write {
        
    
            realm.add(user, update: true)
        }   
    }
        
    }

    static func GetUser()->ModelUser {
        let realm = try! Realm()
        let userCache = realm.objects(ModelUser.self)
        if userCache.count == 0
        {
            let usermodel : ModelUser = ModelUser()
            usermodel.userSurname = "Самсонов"
            usermodel.userName = "Женя"
            usermodel.userPartronymic = "Сергеевич"
            usermodel.userBithday = "23.09.1993"
            usermodel.iserGender = "мужской"
            Cache.UpdateUser(user: usermodel)
            
            return usermodel
            
        }
    print(userCache)
    return  userCache[0]

}
}
