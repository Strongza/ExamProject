//
//  ExamTestViewController.swift
//  Project
//
//  Created by papob boonpat on 5/7/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit

class ExamTestViewController: UIViewController {
    
    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var ansLabel:UILabel!
    @IBOutlet weak var Btn: UIButton!
    var str: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata()
        
        
       
        
    }
    

    @IBAction func addQuestion() {
        questionLabel.text = "\(str)"
        
        
    }
    func loaddata(){
        str = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        //str = "aaaaaaaaa"
        
        if str.count>=200{
            let mySubstring = str.prefix(200)
            questionLabel.text = "\(mySubstring)"
        }else{
            Btn.isHidden = true
            questionLabel.text = "\(str)"
        }
        
        
    }
}
