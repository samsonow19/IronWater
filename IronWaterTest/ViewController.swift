//
//  ViewController.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
   
    @IBOutlet weak var tableView: UITableView!

    var arrayConst: [String]  = ["Имя","Фамилия","Отчество","Дата Рождения","Пол"]
    var userDate = [NSString]()
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
        let userDateDafaults  = UserDefaults.standard
        let  getValue = userDateDafaults.object(forKey: "UserList")
        if getValue == nil {
            userDate.append("Женя")
            userDate.append("Самсонов")
            userDate.append("Сергеевич")
            userDate.append("23.09.1993")
            userDate.append("мужской")
            userDateDafaults.set(userDate, forKey: "UserList")
            userDateDafaults.synchronize()
        }
        else {
            userDate = getValue as! [NSString]
        }
        UserModel.sharedInstance.modelFromArray(array: userDate )
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
      
        let cell = Bundle.main.loadNibNamed("TableViewCellUser",
                                            owner: self, options: nil)?.first
                                            as! TableViewCellUser
        cell.constLabel.text = arrayConst[indexPath.row]
        cell.editLabel.text = userDate[indexPath.row] as String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        let userDateDafaults  = UserDefaults.standard
        let  getValue = userDateDafaults.object(forKey: "UserList")
        userDate = getValue as! [NSString]
    }

}

