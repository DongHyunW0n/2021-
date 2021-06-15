//
//  Survey.swift
//  Survey_Std
//
//  Created by WonDongHyun on 2021/06/10.
//

import UIKit

class Survey: UIViewController {

   
    
    @IBOutlet var radioButtons: [UIButton]!
    @IBOutlet var radioButtons2: [UIButton]!
    @IBOutlet var radioButtons3: [UIButton]!
    @IBOutlet var radioButtons4: [UIButton]!
    
    @IBOutlet weak var send_button: UIButton!
    
    @IBOutlet weak var text_want: UITextView!
    var indexOfOneAndOnly1: Int?
    var indexOfOneAndOnly2: Int?
    var indexOfOneAndOnly3: Int?
    var indexOfOneAndOnly4: Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func touchButtons(_ sender: UIButton) {
        if indexOfOneAndOnly1 != nil{
            if !sender.isSelected{
                for index in radioButtons.indices{
                    radioButtons[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnly1 = radioButtons.firstIndex(of: sender)
            }else{
                sender.isSelected = false
                indexOfOneAndOnly1 = nil
            }
            
        }else{
            sender.isSelected = true
            indexOfOneAndOnly1 = radioButtons.firstIndex(of: sender)
        }
       
        
        
    }
    
    
    @IBAction func touchButtons2(_ sender: UIButton) {
        
        if indexOfOneAndOnly2 != nil{
            if !sender.isSelected{
                for index in radioButtons2.indices{
                    radioButtons2[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnly2 = radioButtons2.firstIndex(of: sender)
            }else{
                sender.isSelected = false
                indexOfOneAndOnly2 = nil
            }
            
        }else{
            sender.isSelected = true
            indexOfOneAndOnly2 = radioButtons2.firstIndex(of: sender)
        }
    }
    
    
    @IBAction func touchButtons3(_ sender: UIButton) {
        if indexOfOneAndOnly3 != nil{
            if !sender.isSelected{
                for index in radioButtons3.indices{
                    radioButtons3[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnly3 = radioButtons3.firstIndex(of: sender)
            }else{
                sender.isSelected = false
                indexOfOneAndOnly3 = nil
            }
            
        }else{
            sender.isSelected = true
            indexOfOneAndOnly3 = radioButtons3.firstIndex(of: sender)
        }
        
        
        
    }
    
   
    @IBAction func touchButtons4(_ sender: UIButton) {
        
        if indexOfOneAndOnly4 != nil{
            if !sender.isSelected{
                for index in radioButtons4.indices{
                    radioButtons4[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnly4 = radioButtons4.firstIndex(of: sender)
            }else{
                sender.isSelected = false
                indexOfOneAndOnly4 = nil
            }
            
        }else{
            sender.isSelected = true
            indexOfOneAndOnly4 = radioButtons4.firstIndex(of: sender)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   }



  
}
