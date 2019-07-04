
import UIKit

class PrepareViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    var id : Int = 0
    var examName : String = ""
    var totalScore: Int = 0
    var examCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "\(examName)"
        self.deskLabel.text = "ข้อสอบชุดนี้ประกอบด้วย\n -ข้อสอบจำนวน \(totalScore) ข้อ\n -คะแนนรวมทั้งหมด \(examCount) คะแนน"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    @IBAction func returnToList(){
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func startExam(){
        let storyboard = AppStoryboard.Exam.instance.instantiateViewController(withIdentifier: "ExamPage")
        navigationController?.pushViewController(storyboard, animated: true)
    }
    

}
