//
//  ViewControllerEdit.swift
//  IronWaterTest
//
//  Created by админ on 18.02.17.
//  Copyright © 2017 админ. All rights reserved.
//

import UIKit

class ViewControllerEdit: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabelViewEdit: UITableView!
    
    var arrayConst: [String]  = ["Имя","Фамилия","Отчество","Дата Рождения","","Пол"]
    var array = [NSString]()
    
    var useDate: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViewEdit.rowHeight = UITableViewAutomaticDimension
        
        let userDateDafaults  = UserDefaults.standard
        array = userDateDafaults.object(forKey: "UserList") as! [NSString] 
        print(array)

        NotificationCenter.default.addObserver(forName: ADD_HEIDHT_CELL_NOTIFICATION, object: nil, queue: nil) { (Notification) in
            UIView.setAnimationsEnabled(false)
            self.tabelViewEdit.beginUpdates()
            self.tabelViewEdit.endUpdates()
            let scrollTo = self.tabelViewEdit.contentSize.height - self.tabelViewEdit.frame.size.height
            self.tabelViewEdit.setContentOffset( CGPoint(x: 0, y: scrollTo), animated: false)
            UIView.setAnimationsEnabled(true)
        } // size textFile
        
        
        NotificationCenter.default.addObserver(forName: HIDE_SHOW_CELL_WITH_DATE_PICKER, object: nil, queue: nil) { (Notification) in
            if self.useDate {
                self.useDate = false
            } else {
                self.useDate = true
            }
            UIView.setAnimationsEnabled(true)
            self.tabelViewEdit.beginUpdates()
            self.tabelViewEdit.endUpdates()
            UIView.setAnimationsEnabled(true)
        }// hide-show
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayConst.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 3 {
        print(arrayConst)
        print(array)
        let cell = Bundle.main.loadNibNamed("TableViewCellEdit", owner: self, options: nil)?.first as! TableViewCellUserEdit
        cell.labelText.text = arrayConst[indexPath.row]
        cell.editText.text = array[indexPath.row] as String
        return cell
        } else {
            if indexPath.row == 3 {
                let cell = Bundle.main.loadNibNamed("TebleViewCellDate", owner: self, options: nil)?.first as! TableViewCellDate
                cell.labelText.text = arrayConst[indexPath.row]
                cell.editTextView.text = array[indexPath.row] as String
                return cell
            }
            if indexPath.row == 4 {
                let cell = Bundle.main.loadNibNamed("TableCellDate", owner: self, options: nil)?.first as! TableCellDate
                return cell
            }
            let cell = Bundle.main.loadNibNamed("TableViewGender", owner: self, options: nil)?.first as! TableViewGender
            cell.labelText.text = arrayConst[indexPath.row]
            cell.editTextView.text = array[indexPath.row-1] as String
            return cell
           
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 {
            if  useDate {
               return UITableViewAutomaticDimension
            } else {
               return 0
            }
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    // MARK: - @IBAction
    
    @IBAction func SaveUserEdit(_ sender: Any) {
       trySaveUserData()
    }

    @IBAction func BackAndTest(_ sender: Any) {
        if UserModel.sharedInstance.dataChanged() {
            let message = "Вы желаете сохранить изменения, в противном случае внесенные правки будут отменены"
            let alertError = UIAlertController(title: "Данные были изменены.", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alertError.addAction(UIAlertAction(title: "Сохранить", style: UIAlertActionStyle.default, handler:{ (UIAlertAction) in
                self.trySaveUserData()

            }))
            alertError.addAction(UIAlertAction(title: "Пропустить", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alertError, animated: true, completion: nil)
        } else {

             self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    // MARK: - MY Function validData and dataChanged
    
    func trySaveUserData(){
       
        if UserModel.sharedInstance.myValidate() {
            UserModel.sharedInstance.saveUserModel()
            print("ok!:)")
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

}
