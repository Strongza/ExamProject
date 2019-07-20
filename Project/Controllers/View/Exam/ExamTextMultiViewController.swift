import UIKit

class ExamTextMultiViewController: UIViewController {

    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var ansLabel:UILabel!
    @IBOutlet weak var ShowBtn: UIButton!
    
    @IBOutlet weak var mAns1: UIView!
    @IBOutlet weak var mAns2: UIView!
    @IBOutlet weak var mAns3: UIView!
    @IBOutlet weak var mAns4: UIView!
    
    @IBOutlet weak var mAns1Label: UILabel!
    @IBOutlet weak var mAns2Label: UILabel!
    @IBOutlet weak var mAns3Label: UILabel!
    @IBOutlet weak var mAns4Label: UILabel!
    
    var question: String! = ""
    var choice: [Choice] = []
   
    
    var str: String!
    var showMore: Bool = false
    var isOne: Bool = false
    var isTwo: Bool = false
    var isThree: Bool = false
    var isFour: Bool = false
    
    
    var selected: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }
    
    @IBAction func clickAns(sender : UIButton){
        let Ans: String! = sender.titleLabel!.text!
        selected(Ans: Ans)
    }
    
    @IBAction func addQuestion() {
        showMore = !showMore
        if showMore {
            ShowBtn.setTitle("Less", for: UIControl.State.normal)
            questionLabel.text = "\(str!)"
        }else{
            if(UIScreen.main.bounds.height <= 568 ){
                let mySubstring = str.prefix(150)
                questionLabel.text = "\(mySubstring)"
            }else{
                let mySubstring = str.prefix(400)
                questionLabel.text = "\(mySubstring)"
            }
            ShowBtn.setTitle("Read More", for: UIControl.State.normal)
        }
    }

    func loaddata(){

        str = question
        if ( UIScreen.main.bounds.height <= 568 ){
            if str.count>=150{
                let mySubstring = str.prefix(150)
                questionLabel.text = "\(mySubstring)"
            }else{
                ShowBtn.isHidden = true
                questionLabel.text = "\(str!)"
            }
        }else{
            if str.count>=400{
                let mySubstring = str.prefix(400)
                questionLabel.text = "\(mySubstring)"
            }else{
                ShowBtn.isHidden = true
                questionLabel.text = "\(str!)"
            }
        }
        setLabel()
    }
    
    func setupStyle() {
        mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
    }
    
    func selected(Ans: String){
        print(Ans)
        switch Int(Ans) {
        case 1:
            isOne = !isOne
            if isOne {
                mAns1.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            }
        
        case 2:
            isTwo = !isTwo
            if isTwo {
                mAns2.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            }
        case 3:
            isThree = !isThree
            if isThree {
                mAns3.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            }
        case 4:
            isFour = !isFour
            if isFour {
                mAns4.backgroundColor = #colorLiteral(red: 0.4094731808, green: 0.3512327075, blue: 0.5621764064, alpha: 0.638859161)
                
            }else{
                mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            }
        default:
            mAns1.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns2.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns3.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
            mAns4.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.4295269692)
        }
    }
    
    func sendMultiAns(){
        selected = []
        if isOne{
            selected.append(1)
        }
        if isTwo{
            selected.append(2)
        }
        if isThree{
            selected.append(3)
        }
        if isFour{
            selected.append(4)
        }
        if isOne != true && isTwo != true && isThree != true && isFour != true{
            selected.append(0)
        }
        isOne = false
        isTwo = false
        isThree = false
        isFour = false
    }
    
    func setLabel() {
        mAns1Label.text = choice[0].choiceText
        mAns2Label.text = choice[1].choiceText
        mAns3Label.text = choice[2].choiceText
        mAns4Label.text = choice[3].choiceText
    }
}
