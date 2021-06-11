//
//  Survey.swift
//  Survey_Std
//
//  Created by WonDongHyun on 2021/06/10.
//

import UIKit

class Survey: UIViewController {

   
    
    @IBOutlet var radioButtons: [UIButton]!
    
    @IBOutlet weak var text_want: UITextView!
    var indexOfOneAndOnly1: Int?
    var indexOfOneAndOnly2: Int?
    
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
    
    

    
    
   

}
