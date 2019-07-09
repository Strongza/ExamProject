//
//  ExamPicViewController.swift
//  Project
//
//  Created by papob boonpat on 8/7/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit

class ExamPicViewController: UIViewController {

    
    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var ansLabel:UILabel!
    @IBOutlet weak var ShowBtn: UIButton!
    
    @IBOutlet weak var mAns1: UIButton!
    @IBOutlet weak var mAns2: UIButton!
    @IBOutlet weak var mAns3: UIButton!
    @IBOutlet weak var mAns4: UIButton!
    
    var str: String!
    var showMore: Bool = false

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata()
        
        
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
        str = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        //str = "aaaaaaaaa"
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
            mAns1.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        case 2:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns2.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        case 3:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns3.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        case 4:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns4.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
        default:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0)
        }
    }
    
}
