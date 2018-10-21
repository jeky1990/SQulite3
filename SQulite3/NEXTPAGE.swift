//
//  NEXTPAGE.swift
//  SQulite3
//
//  Created by mac on 07/09/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class NEXTPAGE: UIViewController {

    
    @IBAction func BACK(_ sender: UIBarButtonItem)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func Logout(_ sender: UIBarButtonItem)
    {
        UserDefaults.standard.set(false, forKey: "jeky")
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sd  = UserDefaults.standard.value(forKey: "username") as? String
        lbl.text = sd
        
    }
    
    @IBAction func NEXTDTORYBOARD(_ sender: UIButton)
    {
        let storyborad1 = UIStoryboard(name: "MainPage", bundle: nil)
        let mainva = storyborad1.instantiateViewController(withIdentifier: "NEXTPAGE")
        self.navigationController?.pushViewController(mainva, animated: true)
    }
    
    
}
    



