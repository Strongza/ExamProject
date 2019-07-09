import UIKit

class ExamMultiTextViewController: UIViewController {
    
    @IBOutlet weak var mQuestion: UILabel!
    @IBOutlet weak var mText1: UILabel!
    @IBOutlet weak var mText2: UILabel!
    @IBOutlet weak var mText3: UILabel!
    @IBOutlet weak var mText4: UILabel!
    
    //Button in page part
    @IBOutlet weak var mNextButton: UIButton!
    @IBOutlet weak var mBackButton: UIButton!
    
    var mExamAll : [QuestionElement] = []
    var currentExam : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        mQuestion.text = self.mExamAll[currentExam].question.questionText
        mText1.text = self.mExamAll[currentExam].choices[0].choiceText
        mText2.text = self.mExamAll[currentExam].choices[1].choiceText
        mText3.text = self.mExamAll[currentExam].choices[2].choiceText
        mText4.text = self.mExamAll[currentExam].choices[3].choiceText
        self.changeButton(currentExam: currentExam, lastExam: mExamAll.count)
    }
    
    @IBAction func backExam() {
//        self.currentExam -= 1
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextExam() {
        self.currentExam += 1
        let examType = self.mExamAll[self.currentExam].question.questionType
        let examChoiceType = self.mExamAll[self.currentExam].choices[0].choicePic
        selectExamView(examType: examType, examChoiceType: examChoiceType)
    }
    
    //call from Action next exam
    func selectExamView(examType: String, examChoiceType: String?) {
        let storyboard = UIStoryboard(name: "Exam", bundle: nil)
        if examType == "single" {
            if examChoiceType == nil {
                //this single choice and text choice
                let vc = storyboard.instantiateViewController(withIdentifier: "ExamSingleTextViewController") as! ExamSingleTextViewController
                vc.mExamAll = self.mExamAll
                vc.currentExam = self.currentExam
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = storyboard.instantiateViewController(withIdentifier: "ExamSinglePicViewController") as! ExamSinglePicViewController
                vc.mExamAll = self.mExamAll
                vc.currentExam = self.currentExam
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else if examType == "multiple" {
            if examChoiceType == nil {
                let vc = storyboard.instantiateViewController(withIdentifier: "ExamMultiTextViewController") as! ExamMultiTextViewController
                vc.mExamAll = self.mExamAll
                vc.currentExam = self.currentExam
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = storyboard.instantiateViewController(withIdentifier: "ExamMultiPicViewController") as! ExamMultiPicViewController
                vc.mExamAll = self.mExamAll
                vc.currentExam = self.currentExam
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    //call from Action next exam
    func changeButton(currentExam: Int, lastExam: Int) {
        switch currentExam {
        case 0:
            //first exam disable back button and enable next button
            print("🦐🦐🦐🦐 firstExam 🦐🦐🦐🦐")
            self.mNextButton.setTitle("Next", for: .normal)
        case lastExam:
            //last exam enable back button and change next button to finish button
            print("🐳🐳🐳🐳 lastExam 🐳🐳🐳🐳")
            self.mBackButton.setTitle("Back", for: .normal)
            self.mNextButton.setTitle("Finish", for: .normal)
        default:
            //first exam enable back button and enable next button
            print("🥓🥓🥓🥓 default 🥓🥓🥓🥓")
            self.mBackButton.setTitle("Back", for: .normal)
            self.mNextButton.setTitle("Next", for: .normal)
        }
    }
}
