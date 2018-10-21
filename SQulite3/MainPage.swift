
//
//  MainPage.swift
//  SQulite3
//
//  Created by mac on 30/08/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class MainPage: UIViewController {

    @IBAction func Logout(_ sender: UIBarButtonItem)
    {
        UserDefaults.standard.set(false, forKey: "jeky")
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = UserDefaults.standard.value(forKey: "username") as? String
}

    @IBAction func NEXTDTORYBOARD(_ sender: UIButton)
    {
        let storyborad1 = UIStoryboard(name: "MainPage", bundle: nil)
        let mainva = storyborad1.instantiateViewController(withIdentifier: "NEXTPAGE")
        self.navigationController?.pushViewController(mainva, animated: true)
    }
    

}
