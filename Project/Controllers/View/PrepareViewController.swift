
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
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func startExam(){
        let storyboard = AppStoryboard.Exam.instance.instantiateViewController(withIdentifier: "ExamPage")
        self.present(storyboard, animated: true, completion: nil)
    }
    

}
