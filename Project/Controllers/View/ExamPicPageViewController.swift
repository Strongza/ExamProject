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
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc @IBAction func logSelectButtom(_ radioButtom: DLRadioButton){
        if radioButtom.isMultipleSelectionEnabled {
            for buttom in radioButtom.selectedButtons(){
                print(String(format: "%@ is selected. \n", buttom.titleLabel!.text!))
            }
        }
    }


}
