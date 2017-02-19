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
    var  user : ModelUser!
    override func viewDidLoad() {

        user = Cache.GetUser()
        array =  [String]()
        array.append(user.userName!)
        array.append(user.userSurname!)
        array.append(user.userPartronymic!)
        array.append(user.userBithday!)
        array.append(user.iserGender!)
        NotificationCenter.default.addObserver(forName: RELOAD_NOTIFICATION, object: nil, queue: nil) { (Notification) in
           
              let newUser  = Cache.GetUser()
            print(self.user)
            self.array.removeAll()
              self.tableView.reloadData()
            self.array.append(newUser.userName!)
            self.array.append(newUser.userSurname!)
            self.array.append(newUser.userPartronymic!)
            self.array.append(newUser.userBithday!)
            self.array.append(newUser.iserGender!)
             print(self.array)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arrayConst.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = Bundle.main.loadNibNamed("TableViewCellUser", owner: self, options: nil)?.first as! TableViewCellUser
        print(array)
        cell.constLabel.text = arrayConst[indexPath.row]
        cell.editLabel.text = array[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
 

}

