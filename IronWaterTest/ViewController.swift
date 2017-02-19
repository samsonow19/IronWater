//
//  ViewController.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var arrayConst: [String]  = ["Имя","Фамилия","Отчество","Дата Рождения","Пол"]
    var array: [String]!
    var pickheight: CGFloat = 0.0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {

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
      
        let cell = Bundle.main.loadNibNamed("TableViewCellUser", owner: self, options: nil)?.first as! TableViewCellUser
        
        cell.constLabel.text = arrayConst[indexPath.row]
        cell.editLabel.text = array[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
 

}

