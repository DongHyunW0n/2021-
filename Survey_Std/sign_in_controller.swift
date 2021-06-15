//
//  login_ui_controller.swift
//  Survey_Std
//
//  Created by WonDongHyun on 2021/06/15.
//

import UIKit
import FirebaseAuth

class sign_in_controller: UIViewController {

    @IBOutlet weak var back_to_login: UIButton!
    @IBOutlet weak var sign_in_btn: UIButton!
    @IBOutlet weak var textfield_id: UITextField!
    @IBOutlet weak var textfield_pw: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sign_in_button(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: textfield_id.text!, password: textfield_pw.text!){(result,error) in
            if error != nil{
                
                self.Output_Alert(title: "오류", message: "계정 생성 실패", text: "확인")
                print(error?.localizedDescription)
                
            }else{
                
                self.Output_Alert(title: "완료", message: "계정 생성 완료", text: "확인")
                print("User Register Successfully")
            }
            
            
            
            
            }
        
    }
    
    @IBAction func back_to_login(_ sender: Any) {
        
        let vcName = self.storyboard?.instantiateViewController(identifier: "login_UI")
        vcName?.modalPresentationStyle = .fullScreen//전체화면으로 보이게
        
        vcName?.modalTransitionStyle = .crossDissolve//애니메이션 삽입
        self.present(vcName!, animated: true, completion: nil)
        
       
        
        
        
        
    }
    //alert을 그냥 쓰기 편하게 함수로 만들어버림
    func Output_Alert(title : String, message : String, text : String) {

            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

            let okButton = UIAlertAction(title: text, style: UIAlertAction.Style.cancel, handler: nil)

            alertController.addAction(okButton)

            return self.present(alertController, animated: true, completion: nil)

        }



    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   } // 화면 아무곳이나 터치하면 키보드 내려가게



    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
