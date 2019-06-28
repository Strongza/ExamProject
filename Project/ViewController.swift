//
//  ViewController.swift
//  Project
//
//  Created by papob boonpat on 27/6/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func listPage() {
        
        let storyboard = AppStoryboard.ExamList.instance.instantiateViewController(withIdentifier: "Exam_storyboard")
        self.present(storyboard, animated: true, completion: nil)
    }


}

