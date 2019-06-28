import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
