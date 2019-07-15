//
//  ExamTestViewController.swift
//  Project
//
//  Created by papob boonpat on 5/7/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit

class ExamTextViewController: UIViewController {
    
    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var ansLabel:UILabel!
    @IBOutlet weak var ShowBtn: UIButton!
    
    @IBOutlet weak var mAns1: UIView!
    @IBOutlet weak var mAns2: UIView!
    @IBOutlet weak var mAns3: UIView!
    @IBOutlet weak var mAns4: UIView!
    
    @IBOutlet weak var mAns1Label: UILabel!
    @IBOutlet weak var mAns2Label: UILabel!
    @IBOutlet weak var mAns3Label: UILabel!
    @IBOutlet weak var mAns4Label: UILabel!
    
    var question: String! = ""
    var choice: [Choice] = []
    
    var str: String! = ""
    var showMore: Bool = false
    var selected: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
   
        setupStyle()
     
    }
    
    @IBAction func clickAns(sender : UIButton){
        let Ans: String! = sender.titleLabel!.text!
        selected(Ans: Ans)
    }
    
    @IBAction func addQuestion() {
        showMore = !showMore
        if showMore {
            ShowBtn.setTitle("Less", for: UIControl.State.normal)
            questionLabel.text = "\(str!)"
        }else{
            if(UIScreen.main.bounds.height <= 568 ){
                let mySubstring = str.prefix(150)
                questionLabel.text = "\(mySubstring)"
            }else{
                let mySubstring = str.prefix(400)
                questionLabel.text = "\(mySubstring)"
            }
            ShowBtn.setTitle("Read More", for: UIControl.State.normal)
        }
    }
    
    func loaddata(){
        if selected != 0 {
            selected(Ans: String(selected))
        }
        
        str = question
        //str = "aaaaaaaaa"
        if ( UIScreen.main.bounds.height <= 568 ){
            if str.count>=150{
                let mySubstring = str.prefix(150)
                questionLabel.text = "\(mySubstring)"
            }else{
                ShowBtn.isHidden = true
                questionLabel.text = "\(str!)"
            }
        }else{
            if str.count>=400{
                let mySubstring = str.prefix(400)
                questionLabel.text = "\(mySubstring)"
            }else{
                ShowBtn.isHidden = true
                questionLabel.text = "\(str!)"
            }
        }
        setLabel()
    }
    
    func setLabel() {
        mAns1Label.text = choice[0].choiceText
        mAns2Label.text = choice[1].choiceText
        mAns3Label.text = choice[2].choiceText
        mAns4Label.text = choice[3].choiceText
    }
    
    func setupStyle() {
        mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
    }
    
    func selected(Ans: String){
        selected = Int(Ans)!
        switch Int(Ans) {
        case 1:
            mAns1.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        case 2:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns2.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        case 3:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns3.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        case 4:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns4.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
        default:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        }
    }
    
}
