//
//  ExamPicMulViewController.swift
//  Project
//
//  Created by papob boonpat on 9/7/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit

class ExamPicMulViewController: UIViewController {

    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var ansLabel:UILabel!
    @IBOutlet weak var ShowBtn: UIButton!
    
    @IBOutlet weak var mAns1: UIButton!
    @IBOutlet weak var mAns2: UIButton!
    @IBOutlet weak var mAns3: UIButton!
    @IBOutlet weak var mAns4: UIButton!
    
    @IBOutlet weak var mAnsPic1: UIImageView!
    @IBOutlet weak var mAnsPic2: UIImageView!
    @IBOutlet weak var mAnsPic3: UIImageView!
    @IBOutlet weak var mAnsPic4: UIImageView!
    
    var question: String! = ""
    var choice: [Choice] = []
    
    
    var str: String!
    var showMore: Bool = false
    var isOne: Bool = false
    var isTwo: Bool = false
    var isThree: Bool = false
    var isFour: Bool = false
    
    var selected: [Int] = []
  
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
                let mySubstring = str.prefix(100)
                questionLabel.text = "\(mySubstring)"
            }else{
                let mySubstring = str.prefix(400)
                questionLabel.text = "\(mySubstring)"
            }
            ShowBtn.setTitle("Read More", for: UIControl.State.normal)
        }
    }

    func loaddata(){
//        str = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        str = question
        if ( UIScreen.main.bounds.height <= 568 ){
            if str.count>=100{
                let mySubstring = str.prefix(100)
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
        setAnsImage()
    }

    func setupStyle() {
        mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
    }
    
    func selected(Ans: String){
        print(Ans)
        switch Int(Ans) {
        case 1:
            isOne = !isOne
            if isOne {
                mAns1.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            }
        case 2:
            isTwo = !isTwo
            if isTwo {
                mAns2.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            }
        case 3:
            isThree = !isThree
            if isThree {
                mAns3.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            }
        case 4:
            isFour = !isFour
            if isFour {
                mAns4.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            }
        default:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        }
    }
    func sendMultiAns(){
        selected = []
        if isOne{
            selected.append(1)
        }
        if isTwo{
            selected.append(2)
        }
        if isThree{
            selected.append(3)
        }
        if isFour{
            selected.append(4)
        }
        if isOne != true && isTwo != true && isThree != true && isFour != true{
            selected.append(0)
        }
        isOne = false
        isTwo = false
        isThree = false
        isFour = false
    }
    func setAnsImage() {
        mAnsPic1.af_setImage(withURL: choice[0].choicePic!.toURL())
        mAnsPic2.af_setImage(withURL: choice[1].choicePic!.toURL())
        mAnsPic3.af_setImage(withURL: choice[2].choicePic!.toURL())
        mAnsPic4.af_setImage(withURL: choice[3].choicePic!.toURL())
    }
}
