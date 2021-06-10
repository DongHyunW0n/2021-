//
//  Survey.swift
//  Survey_Std
//
//  Created by WonDongHyun on 2021/06/10.
//

import UIKit

class Survey: UIViewController {

    @IBOutlet var number1s: [UIButton]!
    @IBOutlet var number2s: [UIButton]!
    
    @IBOutlet weak var text_want: UITextView!
    var indexOfOneAndOnly1: Int?
    var indexOfOneAndOnly2: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchButton1(_ sender: UIButton) {
        if indexOfOneAndOnly1 != nil{
            if !sender.isSelected{
                for index in number1s.indices{
                    number1s[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnly1 = number1s.firstIndex(of: sender)
            }else{
                sender.isSelected = false
                indexOfOneAndOnly1 = nil
            }
        }else{
            sender.isSelected = true
            indexOfOneAndOnly1 = number1s.firstIndex(of: sender)
        }
       
    

    }
    
    @IBAction func touchButton2(_ sender: UIButton) {
        
        if indexOfOneAndOnly2 != nil{
            if !sender.isSelected{
                for index in number1s.indices{
                    number2s[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnly2 = number2s.firstIndex(of: sender)
            }else{
                sender.isSelected = false
                indexOfOneAndOnly2 = nil
            }
        }else{
            sender.isSelected = true
            indexOfOneAndOnly2 = number2s.firstIndex(of: sender)
        }
    }
    

}
