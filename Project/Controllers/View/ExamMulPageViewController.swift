import UIKit
import DLRadioButton

class ExamMulPageViewController: UIViewController {
    
    var radioButtomValue: String!
    @IBOutlet weak var mButton2: UIButton!
    @IBOutlet weak var mButton3: UIButton!
    @IBOutlet weak var mButton4: UIButton!
    @IBOutlet weak var radioButtom: DLRadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonStyle()
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
        self.present(storyboard, animated: true, completion: nil)
    }
    
    
    func setButtonStyle(){
        self.radioButtom.isMultipleSelectionEnabled = true
        radioButtom.drawAsCircle(radius: 36)
        mButton2.drawAsCircle(radius: 36)
        mButton3.drawAsCircle(radius: 36)
        mButton4.drawAsCircle(radius: 36)
    }
    
}


