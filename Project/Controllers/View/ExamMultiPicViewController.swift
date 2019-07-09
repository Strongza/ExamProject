import UIKit

class ExamMultiPicViewController: UIViewController {
    
    @IBOutlet weak var mQuestion: UILabel!
    @IBOutlet weak var mText1: UILabel!
    @IBOutlet weak var mText2: UILabel!
    @IBOutlet weak var mText3: UILabel!
    @IBOutlet weak var mText4: UILabel!
    
    var mExamAll : [QuestionElement] = []
    var currentExam : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        mQuestion.text = self.mExamAll[currentExam].question.questionText
        mText1.text = self.mExamAll[currentExam].choices[0].choiceText
        mText2.text = self.mExamAll[currentExam].choices[1].choiceText
        mText3.text = self.mExamAll[currentExam].choices[2].choiceText
        mText4.text = self.mExamAll[currentExam].choices[3].choiceText
    }
}
