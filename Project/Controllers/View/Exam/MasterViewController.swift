//
//  MasterViewController.swift
//  Project
//
//  Created by papob boonpat on 9/7/2562 BE.
//  Copyright © 2562 papob boonpat. All rights reserved.
//

import UIKit
import Alamofire

class MasterViewController: UIViewController {
    
    @IBOutlet weak var mPreviousButton: UIButton!
    @IBOutlet weak var mNextButton: UIButton!
    
    var index: Int = 1
    var mExamAll : [QuestionElement] = []
    var mAnswerAll : [Int] = []
    var currentExam : Int = 0
    
    lazy var examtextViewController: ExamTextViewController = {
        let storyboard = UIStoryboard(name: "Exam", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamTextViewController") as! ExamTextViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()
    
    lazy var exampicViewController: ExamPicViewController = {
        let storyboard = UIStoryboard(name: "Exam", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamPicViewController") as! ExamPicViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()
    
    lazy var examtextmultiViewController: ExamTextMultiViewController = {
        let storyboard = UIStoryboard(name: "Exam", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamTextMultiViewController") as! ExamTextMultiViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()
    
    lazy var exampicmulViewController: ExamPicMulViewController = {
        let storyboard = UIStoryboard(name: "Exam", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ExamPicMulViewController") as! ExamPicMulViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)
        
        return viewController
        
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedData()
        setupView()
    }
    
    private func setupView(){
        btnChange()
    }
    
    private func updateView(){
        print("🐡🐡🐡🐡 \(self.mExamAll[self.currentExam].choices)")
//        var mQuestionText: String = "Test"
//        var mChoice: [Choice] = []
        var mQuestionText: String = self.mExamAll[self.currentExam].question.questionText
        var mChoice: [Choice] = self.mExamAll[self.currentExam].choices
        switch index {
        case 1:
            examtextViewController.view.isHidden = false
            examtextmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = true
            
            examtextViewController.question = mQuestionText
            examtextViewController.choice = mChoice
            examtextViewController.loaddata()
        case 2:
            examtextViewController.view.isHidden = true
            examtextmultiViewController.view.isHidden = false
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = true
            
            examtextmultiViewController.question = mQuestionText
            examtextmultiViewController.choice = mChoice
            examtextmultiViewController.loaddata()
        case 3:
            examtextViewController.view.isHidden = true
            examtextmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = false
            exampicmulViewController.view.isHidden = true
            
            exampicViewController.question = mQuestionText
            exampicViewController.choice = mChoice
            exampicViewController.loaddata()
        case 4:
            examtextViewController.view.isHidden = true
            examtextmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = false
            
            exampicmulViewController.question = mQuestionText
            exampicmulViewController.choice = mChoice
            exampicmulViewController.loaddata()
        default:
            examtextViewController.view.isHidden = true
            examtextmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = true
        }
        
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
       addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight ]
        self.view.sendSubviewToBack(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    
    @IBAction func Previous(_ sender: Any) {
//        index -= 1
        if self.currentExam == 0 {
            //disable back button
        } else {
            self.currentExam -= 1
        }
        let examType = self.mExamAll[self.currentExam].question.questionType
        let examChoiceType = self.mExamAll[self.currentExam].choices[0].choicePic
        self.selectExamView(examType: examType, examChoiceType: examChoiceType)
//        print("🐳 \(examType)")
//        print("🐞 \(examChoiceType)")
//        print("🐡 \(currentExam)")
//        print(index)
        updateView()
        btnChange()
        clearSelected()
    }
    @IBAction func Next(_ sender: Any) {
        if currentExam == (self.mExamAll.count)-1 {
            //finish button
            let storyboard = UIStoryboard(name: "Result", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Result") as! ResultViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            currentExam += 1
        }
        let examType = self.mExamAll[self.currentExam].question.questionType
        let examChoiceType = self.mExamAll[self.currentExam].choices[0].choicePic
        self.selectExamView(examType: examType, examChoiceType: examChoiceType)
//        print("🐳 \(examType)")
//        print("🐞 \(examChoiceType)")
//        print("🐡 \(currentExam)")
//        print(index)
        updateView()
        btnChange()
        clearSelected()
    }
    
    @objc func feedData(){
        AF.request("http://localhost:9000/api/exam/1", method: .get).responseJSON { (response) in
//        AF.request("http://192.168.109.95:8085/api/exam/1", method: .get).responseJSON { (response) in
    
            switch response.result{
            case .success(let value):
                
//                var result = value as! [String:Any]
//              var data = result["data"]
//
//                  var temp = data as! [String:Any]
//
//
//                     var final = temp["questions"]
//
//                print(final)
//
                
                
                do{
                    print("🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳")
                    print("☄️\(response.data)")
                    
                
                    
                    
                    let result = try JSONDecoder().decode(GoHome.self, from: response.data!)
//                    let decodedString = String(DataClass: result.data, encoding: String.Encoding.utf8)
//                    print(decodedString ?? "") // decodedString
                    
                    print("⭐️\(result.data)")
                    self.mExamAll = result.data.questions
                    
                   
                    
//
//                    let allLogs = string.components(separatedBy: .newlines)
//                        .filter { $0 != "" }
//                        .map { jsonLine -> Log? in
//                            guard let data = jsonLine.data(using: .utf8) else {
//                                return nil
//                            }
//                            return try? jsonDecoder.decode(Log.self, from: data)
//                        }.flatMap { $0 }
                    
                    
                    
                    let examType = self.mExamAll[self.currentExam].question.questionType
                    let examChoiceType = self.mExamAll[self.currentExam].choices[0].choicePic
                    
                    print("🐳 \(examType)")
                    print("🐞 \(examChoiceType)")
                    self.selectExamView(examType: examType, examChoiceType: examChoiceType)
                    
                    self.updateView()
                }catch{
                    print("network error: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("network error: \(error.localizedDescription)")
            }
            // 2 second
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            }
        }
    }
    
    func btnChange(){
        switch currentExam {
        case 0:
            mPreviousButton.isHidden = true
        case self.mExamAll.count-1:
            mNextButton.setTitle("Finish", for: .normal)
        default:
            mPreviousButton.isHidden = false
            mNextButton.isHidden = false
        }
    }
    
    func selectExamView(examType: String, examChoiceType: String?) {
        if examType == "single" {
            if examChoiceType == nil {
                //single choice and text choice
                index = 1
            } else {
                //single choice and picture choice
                index = 3
            }
        } else if examType == "multiple" {
            if examChoiceType == nil {
                //multi choice and text choice
                index = 2
            } else {
                //multi choice and picture choice
                index = 4
            }
        }
    }
    
    func clearSelected(){
        examtextViewController.setupStyle()
        examtextmultiViewController.setupStyle()
        exampicViewController.setupStyle()
        exampicmulViewController.setupStyle()
    }
}
