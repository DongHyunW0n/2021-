//
//  ViewController.swift
//  Survey_Std
//
//  Created by 원동현 on 2021/06/01.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
  
    @IBOutlet weak var textfield_id: UITextField!
    @IBOutlet weak var textfield_pw: UITextField!
    @IBOutlet weak var button_login: UIButton!
    @IBOutlet weak var button_sign_in: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private let db = DBHelper()
    @IBAction func sign_in_button(_ sender: Any) {
        
        let vcName = self.storyboard?.instantiateViewController(identifier: "sign_in_ui")
        vcName?.modalPresentationStyle = .fullScreen//전체화면으로 보이게
        
        vcName?.modalTransitionStyle = .crossDissolve//애니메이션 삽입
        self.present(vcName!, animated: true, completion: nil)
     
        
    }
    
    @IBAction func login_button(_ sender: Any) {//로그인 버튼을 누르면 생기는 일들
        
        Auth.auth().signIn(withEmail: textfield_id.text!,password: textfield_pw.text!){(result,error) in
            if error != nil{
                print(error?.localizedDescription)
                
                self.Output_Alert(title: "오류", message: "로그인 실패", text: "확인")
            }else{
                print("로그인 성공!")
                
               
                let vcName = self.storyboard?.instantiateViewController(identifier: "start_Controller")
                vcName?.modalPresentationStyle = .fullScreen//전체화면으로 보이게
                
                vcName?.modalTransitionStyle = .crossDissolve//애니메이션 삽입
                self.present(vcName!, animated: true, completion: nil)
            }
        }
    }
    
    func Output_Alert(title : String, message : String, text : String) {

            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

            let okButton = UIAlertAction(title: text, style: UIAlertAction.Style.cancel, handler: nil)

            alertController.addAction(okButton)

            return self.present(alertController, animated: true, completion: nil)

        }
    
    
    //화면 아무곳이나 터치하면 키보드 내려가게
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   }



  

}
