//
//  ViewController.swift
//  Survey_Std
//
//  Created by 원동현 on 2021/06/01.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var textfield_id: UITextField!
    @IBOutlet weak var textfield_pw: UITextField!
    @IBOutlet weak var button_login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private let db = DBHelper()
    
    @IBAction func login_button(_ sender: Any) {//로그인 버튼을 누르면 생기는 일들
        let vcName = self.storyboard?.instantiateViewController(identifier: "start_Controller")
        vcName?.modalPresentationStyle = .fullScreen//전체화면으로 보이게
        
        vcName?.modalTransitionStyle = .crossDissolve//애니메이션 삽입
        self.present(vcName!, animated: true, completion: nil)
        
        //DB - sqlite파트
        guard let id = textfield_id.text else {return}
        guard let pw = textfield_pw.text else {return}
    
        let isEmpty = id.isEmpty && pw.isEmpty
    
        if !isEmpty{
            db.query(queryString: "select * from user where id='\(id)' AND pw='\(pw)'")
            print("로그인 성공")
        }
    }
    
   
    //임시로 만든 데이터 입력 버튼
    @IBAction func DataInputButton(_ sender: Any) {
        guard let id = textfield_id.text else {return}
        guard let pw = textfield_pw.text else {return}
    
        let isEmpty = id.isEmpty && pw.isEmpty
    
        if !isEmpty{
            db.insert(queryString: "insert into user(id, pw) values(?, ?)", id: NSString(string:id ), pw: NSString(string: pw))
        }
    }
    
    
}

