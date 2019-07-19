import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var score_user: UILabel!
    @IBOutlet weak var score_total: UILabel!
    
    var sum = 0
    var total = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        score_user.text = String(sum)
        score_total.text = String(total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func listPage() {
        
        let storyboard = AppStoryboard.ExamList.instance.instantiateViewController(withIdentifier: "Exam_storyboard")
        navigationController?.pushViewController(storyboard, animated: true)
    }
    
    @IBAction func goToMain(){
        self.dismiss(animated: true, completion: nil)
       
    }
    
}
