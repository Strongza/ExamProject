import UIKit
import Alamofire

class ExamListViewController: UIViewController {


    
    var mDataArray: [Datum] = []
    var searchedTitle = [Datum]()
    var searching = false
    var ID: Int = 0
    var examName: String = ""
    var totalScore: Int = 0
    var examCount: Int = 0
    
    
    @IBOutlet weak var mSearchBar: UISearchBar!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mBanner: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedData()
        mBanner.dropShadow()
        
        print( UIScreen.main.bounds.height )
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    @IBAction func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func feedData(){

 //              AF.request("http://192.168.110.136:9999/exam/exam_list", method: .get).responseJSON { (response) in
        AF.request("http://localhost:9000/api/exam/list_exam", method: .get).responseJSON { (response) in

            switch response.result{
            case .success:
                
                print(response)
                do{
                    
                    print(response)
                    let result = try JSONDecoder().decode(ExamlistResponse.self, from: response.data!)
                    self.mDataArray = result.data
                    self.mTableView.reloadData()
                    
                }catch{
                    
                }
                
            case .failure(let error):
                print(response)
                print("network error: \(error.localizedDescription)")
                let alertVC = UIAlertController(title: "Network Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "cancel", style: .cancel, handler:  { (alert) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alertVC, animated: true, completion: nil)
            }
            
        }
    }
}

extension ExamListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedTitle.count
        } else {
            return mDataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExamListTableViewCell
        let item = mDataArray[indexPath.row]
        
      
        
//        print(item)
        if searching {
            let sItem = searchedTitle[indexPath.row]
            cell.mTextLabel.text = sItem.examName
        } else {
            cell.mTextLabel.text = item.examName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mDataArray[indexPath.row]
        
        
        if searching {
            let sItem = searchedTitle[indexPath.row]
             self.ID = sItem.examID
             self.examName = sItem.examName
             self.totalScore = sItem.examTotalScore
             self.examCount = sItem.countQuestion
        } else {
             self.ID = item.examID
            self.examName = item.examName
            self.totalScore = item.examTotalScore
            self.examCount = item.countQuestion
        }
        
        let storyboard = UIStoryboard(name: "Preparetoexam", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PrepareExam") as! PrepareViewController
        vc.id = self.ID
        vc.examName = self.examName
        vc.totalScore = self.totalScore
        vc.examCount = self.examCount
        
        
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}


extension ExamListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedTitle = mDataArray.filter{ $0.examName.lowercased().contains(searchText.lowercased()) }
        if searchBar.text == ""{
            searching = false
        }else{
            searching = true
        }
    
        mTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        mTableView.reloadData()
    }
    
}
