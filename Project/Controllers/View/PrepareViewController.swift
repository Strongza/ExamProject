
import UIKit

class PrepareViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func returnToList(){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func startExam(){
        let storyboard = AppStoryboard.Exam.instance.instantiateViewController(withIdentifier: "ExamPage")
        self.present(storyboard, animated: true, completion: nil)
    }
    

}
