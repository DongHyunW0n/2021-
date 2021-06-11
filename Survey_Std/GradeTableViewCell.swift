//
//  GradeTableViewCell.swift
//  Survey_Std
//
//  Created by WonDongHyun on 2021/06/12.
//

import UIKit

class GradeTableViewCell: UITableViewCell {
    
    @IBOutlet var SubjectName:UILabel!
    @IBOutlet var Grade:UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
