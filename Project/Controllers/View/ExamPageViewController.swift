import UIKit
import DLRadioButton

class ExamPageViewController: UIViewController {
    
    var radioButtomValue: String!
    @IBOutlet weak var mButton1: UIButton!
    @IBOutlet weak var mButton2: UIButton!
    @IBOutlet weak var mButton3: UIButton!
    @IBOutlet weak var mButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setButtonStyle()
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

    func setButtonStyle(){
        mButton1.drawAsCircle(radius: 36)
        mButton2.drawAsCircle(radius: 36)
        mButton3.drawAsCircle(radius: 36)
        mButton4.drawAsCircle(radius: 36)
    }
    
}
