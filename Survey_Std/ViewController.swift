//
//  ViewController.swift
//  Survey_Std
//
//  Created by 원동현 on 2021/06/01.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var button_login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func login_button(_ sender: Any) {//로그인 버튼을 누르면 생기는 일들
        let vcName = self.storyboard?.instantiateViewController(identifier: "start_Controller")
        vcName?.modalPresentationStyle = .fullScreen//전체화면으로 보이게
        
        vcName?.modalTransitionStyle = .crossDissolve//애니메이션 삽입
        self.present(vcName!, animated: true, completion: nil)
        
    }
    
}

