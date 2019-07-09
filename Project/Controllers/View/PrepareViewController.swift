
import UIKit
import Alamofire

class PrepareViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    var mExamAll : [QuestionElement] = []
    var mAnswerAll : [Int] = []
    var currentExam : Int = 0
    var id : Int = 0
    var examName : String = ""
    var totalScore: Int = 0
    var examCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "\(examName)"
        self.deskLabel.text = "ข้อสอบชุดนี้ประกอบด้วย\n -ข้อสอบจำนวน \(examCount) ข้อ\n -คะแนนรวมทั้งหมด \(totalScore) คะแนน"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    @IBAction func returnToList(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func startExam(){
        self.feedData()
//        let storyboard = AppStoryboard.Exam.instance.instantiateViewController(withIdentifier: "ExamPage")
//        navigationController?.pushViewController(storyboard, animated: true)
    }
    
    @objc func feedData(){
        AF.request("http://localhost:9000/api/exam/1", method: .get).responseJSON { (response) in
            
            switch response.result{
            case .success:
                
                do{
                    let result = try JSONDecoder().decode(ExamResponse.self, from: response.data!)
                    self.mExamAll = result.data.questions
                    let examType = self.mExamAll[self.currentExam].question.questionType
                    let examChoiceType = self.mExamAll[self.currentExam].choices[0].choicePic
                    
                    self.selectExamView(examType: examType, examChoiceType: examChoiceType)
                    
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
}
