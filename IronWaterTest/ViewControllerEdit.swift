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
        // #warning Incomplete implementation, return the number of rows
        
        return arrayConst.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 4 {
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
        
        
    }
    
    func validatinDateUser() -> Bool{
        
        return true
    }

    
    @IBAction func BackAndTest(_ sender: Any) {
    }

  

}
