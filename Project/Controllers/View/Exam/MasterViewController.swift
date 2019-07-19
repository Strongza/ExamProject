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
    
    var id: Int = 1
    var index: Int = 1
    var mExamAll : [QuestionElement] = []
    var currentExam : Int = 0
    var examCount: Int = 0
    var mAnswerAll: [[Int]] = []
    var sum: Int = 0
    var total : Int = 0
    
    
    
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
        
  //      mAnswerAll = Array(repeating: Array(),count: self.examCount)
        mAnswerAll = Array(repeating: Array(),count: self.examCount)
 //       print("💓💓💓💓💓💓\(mAnswerAll.count)💓💓💓💓💓💓")
        self.feedData()
        setupView()
    }
    
    private func setupView(){
        btnChange()
    }
    
    private func updateView(){
        print("🧲🧲🧲\(currentExam)🧲🧲🧲")
//        print("🐡🐡🐡🐡 \(self.mExamAll[self.currentExam].choices)")
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
            if mAnswerAll[currentExam].count != 0{
                let ans : String = String(mAnswerAll[currentExam][0])
                examtextViewController.selected(Ans: ans)
            }
            else{
                examtextViewController.selected = 0
                clearSelected()
            }
            examtextViewController.loaddata()
            
        case 2:
            examtextViewController.view.isHidden = true
            examtextmultiViewController.view.isHidden = false
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = true
            examtextmultiViewController.question = mQuestionText
            examtextmultiViewController.choice = mChoice
            if mAnswerAll[currentExam].count != 0{
                for i in 0...mAnswerAll[currentExam].count-1{
                    let ans : String = String(mAnswerAll[currentExam][i])
                    examtextmultiViewController.selected(Ans: ans)
                }
            }
            else{
                examtextmultiViewController.isOne = false
                examtextmultiViewController.isTwo = false
                examtextmultiViewController.isThree = false
                examtextmultiViewController.isFour = false
                examtextmultiViewController.selected = []
                clearSelected()
            }
            examtextmultiViewController.loaddata()
        case 3:
            examtextViewController.view.isHidden = true
            examtextmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = false
            exampicmulViewController.view.isHidden = true
            exampicViewController.question = mQuestionText
            exampicViewController.choice = mChoice
            if mAnswerAll[currentExam].count != 0{
                let ans : String = String(mAnswerAll[currentExam][0])
                exampicViewController.selected(Ans: ans)
            }
            else{
                exampicViewController.selected = 0
                clearSelected()
            }
            exampicViewController.loaddata()
        case 4:
            examtextViewController.view.isHidden = true
            examtextmultiViewController.view.isHidden = true
            exampicViewController.view.isHidden = true
            exampicmulViewController.view.isHidden = false
            
            exampicmulViewController.question = mQuestionText
            exampicmulViewController.choice = mChoice
            if mAnswerAll[currentExam].count != 0{
                for i in 0...mAnswerAll[currentExam].count-1{
                    let ans : String = String(mAnswerAll[currentExam][i])
                    exampicmulViewController.selected(Ans: ans)
                }
            }
            else{
                exampicmulViewController.isOne = false
                exampicmulViewController.isTwo = false
                exampicmulViewController.isThree = false
                exampicmulViewController.isFour = false
                exampicmulViewController.selected = []
                clearSelected()
            }
            
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
        getAnswer()
        print("🦄🦄\(mAnswerAll)🦄🦄")
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
//        clearSelected()
        updateView()
        btnChange()
        
    }
    
    @IBAction func Next(_ sender: Any) {
        getAnswer()
        print("🦄🦄\(mAnswerAll)🦄🦄")
        if currentExam == (self.mExamAll.count)-1 {
            var sum_score: Int = 0
            var sum_userScore: Int = 0
            //finish button
            let storyboard = UIStoryboard(name: "Result", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Result") as! ResultViewController
            if mAnswerAll.contains([0]){
                print("🎁🎁🎁🎁🎁🎁🎁")
                let alertVC = UIAlertController(title: "Warning!", message: "Please complete all questions", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "cancel", style: .cancel, handler:  { (alert) in
                    
                }))
                self.present(alertVC, animated: true, completion: nil)
            }
            else{
                for i in 0...mAnswerAll.count-1{
                    if self.mExamAll[i].question.questionType == "single"{
                        sum += self.mExamAll[i].choices[mAnswerAll[i][0]-1].choiceScore
                    }
                    else{
                        
                        for j in 0...self.mExamAll[i].choices.count-1{
                            sum_score += self.mExamAll[i].choices[j].choiceScore
                        }
                        for k in 0...self.mAnswerAll[i].count-1{
                            sum_userScore += self.mExamAll[i].choices[mAnswerAll[i][k]-1].choiceScore
                        }
                        if sum_score == sum_userScore{
                            sum += 1
                        }
                    }
                    sum_score = 0
                    sum_userScore = 0
                }
                vc.sum = self.sum
                vc.total = self.total
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        } else {
            currentExam += 1
            
        }
        
        let examType = self.mExamAll[self.currentExam].question.questionType
        let examChoiceType = self.mExamAll[self.currentExam].choices[0].choicePic
        self.selectExamView(examType: examType, examChoiceType: examChoiceType)
        
        updateView()
        btnChange()
        
    }
    
    func getAnswer() {
        switch index {
        case 1:
            //mAnswerAll.insert(examtextViewController.selected, at: currentExam)
            let ansint: [Int] = [examtextViewController.selected]
            mAnswerAll[currentExam] = ansint
        case 2:
            examtextmultiViewController.sendMultiAns()
            //mAnswerAll.insert(examtextmultiViewController.selected, at: currentExam)
            mAnswerAll[currentExam] = examtextmultiViewController.selected
        case 3:
//            mAnswerAll.insert(exampicViewController.selected, at: currentExam)
            let ansint: [Int] = [exampicViewController.selected]
            mAnswerAll[currentExam] = ansint
        case 4:
            exampicmulViewController.sendMultiAns()
            mAnswerAll[currentExam] = exampicmulViewController.selected
//            mAnswerAll.insert(exampicmulViewController.selected, at: currentExam)
        default:
            //SomeThing
            break
        }
    }
    
    @objc func feedData(){
        AF.request("http://localhost:9000/api/exam/1", method: .get).responseJSON { (response) in
//        print("🍉\(id)")

//        AF.request("http://192.168.110.136:9999/exam/\(id)", method: .get).responseJSON { (response) in

            switch response.result{
            case .success(let value):
                do{
                    print("🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳🐳")
                    print("☄️\(response.data)")
                    let result = try JSONDecoder().decode(GoHome.self, from: response.data!)
                    print("⭐️\(result.data)")
                    self.mExamAll = result.data.questions
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
            mNextButton.setTitle("Next", for: .normal)
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
