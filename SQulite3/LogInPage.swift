//
//  LogInPage.swift
//  SQulite3
//
//  Created by mac on 30/08/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class LogInPage: UIViewController {

    @IBOutlet var Password: UITextField!
    @IBOutlet var Username: UITextField!
    
    var arr : [Any] = []
    var i = 0
    
    var name : String?
    var pass : String?
    var flag : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetData()
    }

    @IBAction func BACK(_ sender: Any)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func LogIn(_ sender: UIButton)
    {
        FetchData()
        if i == arr.count
        {
            let alert = UIAlertController(title: "Error In LogIn", message: "Username or Password NotMatch with Data", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            i = 0
        }
    }
    func FetchData()
    {
        for _ in arr
        {
            var Arr = arr[i] as? [String]
            if Username.text == Arr![1] && Password.text == Arr![2]
            {
                UserDefaults.standard.set(true, forKey: "jeky")
                UserDefaults.standard.set(Username.text!, forKey: "username")
                let storyborad1 = UIStoryboard(name: "MainPage1", bundle: nil)
                let mainva = storyborad1.instantiateViewController(withIdentifier: "NEXTPAGE")
                self.navigationController?.pushViewController(mainva, animated: true)
                i = 0
                break
            }
            i = i+1
        }
    }
    func GetData()
    {
        let db = dbclass()
        let query = "select *from jeky_data"
        
        arr = db.getData(query: query)
        print(arr)
    }
    
    
}
