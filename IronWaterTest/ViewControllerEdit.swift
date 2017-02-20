//
//  ViewControllerEdit.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class ViewControllerEdit: UIViewController , UITableViewDataSource, UITableViewDelegate {

    var arrayConst: [String]  = ["Имя","Фамилия","Отчество","Дата Рождения","Пол"]
    var array: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  user : ModelUser = Cache.GetUser()
        array =  [String]()
        array.append(user.userName!)
        array.append(user.userSurname!)
        array.append(user.userPartronymic!)
        array.append(user.userBithday!)
        array.append(user.iserGender!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayConst.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 4 {
        print(arrayConst)
        print(array)
        let cell = Bundle.main.loadNibNamed("TableViewCellEdit", owner: self, options: nil)?.first as! TableViewCellUserEdit
        cell.labelText.text = arrayConst[indexPath.row]
        cell.editText.text = array[indexPath.row]
            
        return cell
        } else {
            let cell = Bundle.main.loadNibNamed("TableViewGender", owner: self, options: nil)?.first as! TableViewGender
            cell.labelText.text = arrayConst[indexPath.row]
            cell.editTextView.text = array[indexPath.row]
            
            return cell
        }
        
    }
    
    
    
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
   
    @IBAction func SaveUserEdit(_ sender: Any) {
      
       validData()
       
    }
    


    
    @IBAction func BackAndTest(_ sender: Any) {
        if dataChanged() == true {
            let message = "Вы желаете сохранить изменения, в противном случае внесенные правки будут отменены"
            let alertError = UIAlertController(title: "Данные были изменены.", message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            alertError.addAction(UIAlertAction(title: "Сохранить", style: UIAlertActionStyle.default, handler:{ (UIAlertAction) in
                self.validData()
               // Cache.UpdateUser(user: userModelEdit)

            }))
            
            alertError.addAction(UIAlertAction(title: "Пропустить", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alertError, animated: true, completion: nil)
            
        } else {

             self.navigationController?.popViewController(animated: true)
        }
        
    }
    func validData(){
        NotificationCenter.default.post(Notification(name:VALIDATE_NOTIFICATION))
        
        if validateName&&validateSurname&&validatePartronymic&&validateBithday == true {
            
            print("ok!:)")
            print(userModelEdit)
            
  
            NotificationCenter.default.post(Notification(name:RELOAD_NOTIFICATION))
           
            self.navigationController?.popViewController(animated: true)
            
        }
        else {
            let message = "все поля обязательные, дата должна вводится в формате 25.01.1990 и не должна быть в будущем"
            let alertError = UIAlertController(title: "Ошибка", message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            alertError.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertError, animated: true, completion: nil)
            
            print("ne ok!:)")
        }

    }
    
    func dataChanged()->Bool{
        let  user  = Cache.GetUser()
        print(userModelEdit)
        if user.iserGender != userModelEdit.iserGender {
            return true
        }
        if user.userBithday != userModelEdit.userBithday {
            print(user.userBithday)
            print(userModelEdit.userBithday)
            return true
        }
        if user.userName != userModelEdit.userName {
            return true
        }
        if user.userPartronymic != userModelEdit.userPartronymic {
            return true
        }
        if user.userSurname != userModelEdit.userSurname {
            return true
        }
        return false
    }

  

}
