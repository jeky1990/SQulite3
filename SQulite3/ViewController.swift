//
//  ViewController.swift
//  SQulite3
//
//  Created by mac on 27/07/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let brr = arr[indexPath.section] as! [Any]

        cell.textLabel?.text = brr[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        brr = arr [indexPath.section] as! [Any]
        
        let emp_name1 : Int? = Int(emp_id.text!)
        let delete = "delete from jeky_data where emp_id = \(emp_name1)"
        
        let db = dbclass()
        _ = db.dml(query: delete)
        arr.remove(at: indexPath.section)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        select = arr[indexPath.section] as! [Any]

        emp_id.text = select[0] as? String
        emp_name.text = select[1] as? String
        emp_add.text = select[2] as? String
        updateip = indexPath.section
    }
    @IBAction func Update(_ sender: UIButton)
    {
        var brr = arr[updateip] as! [Any]
        brr.removeAll()
        
        let emp_id1 = emp_id.text!
        let emp_name1 = emp_name.text!
        let emp_add1 = emp_add.text!
    
        brr.insert(emp_id1, at: 0)
        brr.insert(emp_name1, at: 1)
        brr.insert(emp_add1, at: 2)
        
        let db = dbclass()
        let updatequery = "update jeky_data set emp_id = \(emp_id1),emp_name = \(emp_name1),emp_add=\(emp_add1) where emp_id = \(emp_id1)"
        
        brr = db.getData(query: updatequery)
        arr.append(brr)
        arr.remove(at:updateip)
        arr.insert(brr, at:updateip)
        readdata()
    }
    
    @IBAction func Delete(_ sender: UIButton)
    {
        var brr = arr[updateip] as! [Any]
        
        let emp_name1 : String = ""
        let db = dbclass()
        
        let DeleteQuery = "Delete from jeky_data where emp_name = \(emp_name1)"
        
        brr = db.getData(query: DeleteQuery)
        
        readdata()
        
    }
    
    var select : [Any] = []
    var arr : [Any] = []
    var brr : [Any] = []
    var updateip : Int = 0
    @IBOutlet var Tbl: UITableView!
    @IBOutlet var emp_add: UITextField!
    @IBOutlet var emp_name: UITextField!
    @IBOutlet var emp_id: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        readdata()
        
        if UserDefaults.standard.bool(forKey: "jeky") == true
        {
            let storyborad1 = UIStoryboard(name: "MainPage1", bundle: nil)
            let mainva = storyborad1.instantiateViewController(withIdentifier: "NEXTPAGE")
            self.navigationController?.pushViewController(mainva, animated: true)
        }
    }
    
    func readdata()
    {
        let db = dbclass()
        arr = db.getData(query: "select * from jeky_data")
        print(arr)
        Tbl.reloadData()
    }
    
    @IBAction func Insert(_ sender: Any)
    {
        let db = dbclass()
        
        let query =  "insert into jeky_data (emp_id,emp_name,emp_add) values ('\(emp_id.text!)','\(emp_name.text!)','\(emp_add.text!)')"
        
        let st = db.dml(query: query)
        if st == true
        {
            print("Data In")
        }
        readdata()
    }
    
    @IBAction func LogIn(_ sender: UIButton)
    {
        let nav:LogInPage = self.storyboard?.instantiateViewController(withIdentifier: "LogInPage") as! LogInPage
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
    

}

