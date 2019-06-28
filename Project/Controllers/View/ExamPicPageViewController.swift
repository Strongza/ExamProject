import UIKit
import DLRadioButton

class ExamPicPageViewController: UIViewController {
    
    var radioButtomValue: String!
    @IBOutlet weak var mButton1: UIButton!
    @IBOutlet weak var mButton2: UIButton!
    @IBOutlet weak var mButton3: UIButton!
    @IBOutlet weak var mButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    @objc @IBAction func logSelectButtom(_ radioButtom: DLRadioButton){
        if radioButtom.isMultipleSelectionEnabled {
            for buttom in radioButtom.selectedButtons(){
                print(String(format: "%@ is selected. \n", buttom.titleLabel!.text!))
            }
        }
    }

    @IBAction func previousButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        let storyboard = AppStoryboard.Exam.instance.instantiateViewController(withIdentifier: "ExamMulPageViewController")
        storyboard.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(storyboard, animated: true)
    }
    
}
