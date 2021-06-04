//
//  ViewController.swift
//  Survey_Std
//
//  Created by 원동현 on 2021/06/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var login_btn: UIButton!
    
    let loginStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick_login(_ sender: Any) {
        let login = loginStoryBoard.instantiateViewController(identifier:"main_menu_controller" )
        
        self.show(login,sender: self)
    }
    
}

