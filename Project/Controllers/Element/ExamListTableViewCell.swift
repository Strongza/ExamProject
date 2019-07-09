//
//  ExamListTableViewCell.swift
//  Project
//
//  Created by papob boonpat on 26/6/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit

class ExamListTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var mCardView: UIView!
    @IBOutlet weak var mTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mCardView.drawAsCircle(radius: 5)
        self.mCardView.dropShadow()
        self.mCardView.backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1568627451, alpha: 0.55)
        self.backgroundColor = #colorLiteral(red: 0.1087233052, green: 0.1087233052, blue: 0.1087233052, alpha: 0)
        self.mTextLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
