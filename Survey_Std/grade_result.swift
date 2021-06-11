//
//  grade_result.swift
//  Survey_Std
//
//  Created by WonDongHyun on 2021/06/12.
//

import UIKit

class grade_result: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView:UITableView!
    
    let myData = ["소프트웨어개발실습3","인공지능","채플3","달란트와 진로3","기계학습","학문과 신앙","교양생활영어말하기3"]
    let myGrade = ["A+","B+","B+","A+","A0","P","A-"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "GradeTableViewCell", bundle: nil)

        tableView.register(nib, forCellReuseIdentifier: "GradeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    
    //TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GradeTableViewCell", for: indexPath) as! GradeTableViewCell
        
        cell.SubjectName.text = myData[indexPath.row]
        cell.Grade.text = myGrade[indexPath.row]
        return cell
    }
    


   

}
