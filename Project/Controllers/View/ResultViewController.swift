import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func listPage() {
        
        let storyboard = AppStoryboard.ExamList.instance.instantiateViewController(withIdentifier: "Exam_storyboard")
        self.present(storyboard, animated: true, completion: nil)
    }
}
