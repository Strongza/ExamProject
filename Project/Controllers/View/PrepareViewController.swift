
import UIKit

class PrepareViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
