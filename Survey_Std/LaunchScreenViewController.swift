//
//  LaunchScreenViewController.swift
//  Survey_Std
//
//  Created by swa on 2021/06/11.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // postDelay
        // 1초 뒤에 실행
    }
    override func viewDidAppear(_ animated: Bool) {
          checkDeviceNetworkStatus()
       }
    
    func checkDeviceNetworkStatus() {
           if(DeviceManager.shared.netWorkStatus) {
            guard let vc:ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "login_UI") as? ViewController else { return }
            
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
        
           } else {
               let alert: UIAlertController = UIAlertController(title: "네트워크 상태 확인", message: "네트워크가 불안정 합니다.", preferredStyle: .alert)
               let action: UIAlertAction = UIAlertAction(title: "다시 시도", style: .default, handler: { (ACTION) in
                   self.checkDeviceNetworkStatus()
               })
               alert.addAction(action)
               present(alert, animated: true, completion: nil)
           }
       }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
