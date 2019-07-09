import UIKit
import DLRadioButton

class ExamMulPageViewController: UIViewController {
    
    var radioButtomValue: String!
    @IBOutlet weak var mButton2: UIButton!
    @IBOutlet weak var mButton3: UIButton!
    @IBOutlet weak var mButton4: UIButton!
    @IBOutlet weak var radioButtom: DLRadioButton!
    
    @IBOutlet weak var mQuestion: UILabel!
    
    //Variable from prepare data
    var question : String = ""
    var choices : [Choice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonStyle()
        mQuestion.text = self.question
        mButton2.setTitle("Test", for: .normal)
        mButton3.setTitle("Test", for: .normal)
        mButton4.setTitle("Test", for: .normal)
        radioButtom.setTitle("Test", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc @IBAction func logSelectButtom(_ radioButtom: DLRadioButton){
        if radioButtom.isMultipleSelectionEnabled {
            for buttom in radioButtom.selectedButtons(){
                print(String(format: "%@ is selected. \n", buttom.titleLabel!.text!))
            }
        }else{
            radioButtomValue = radioButtom.selected()?.titleLabel!.text!
            print(String(format: "%@ is selected. \n", radioButtomValue))
        }
    }
    
    @IBAction func Finish(){
        
        let storyboard = AppStoryboard.Result.instance.instantiateViewController(withIdentifier: "Result")
        navigationController?.pushViewController(storyboard, animated: true)
        
    }
    
    
    func setButtonStyle(){
        self.radioButtom.isMultipleSelectionEnabled = true
        radioButtom.drawAsCircle(radius: 36)
        mButton2.drawAsCircle(radius: 36)
        mButton3.drawAsCircle(radius: 36)
        mButton4.drawAsCircle(radius: 36)
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}


