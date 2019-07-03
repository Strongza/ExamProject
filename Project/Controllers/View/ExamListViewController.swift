import UIKit
import Alamofire

class ExamListViewController: UIViewController {


    
    var mDataArray: [Datum] = []
    var searchedTitle = [Datum]()
    var searching = false
    var ID: String = ""
    
    
    @IBOutlet weak var mSearchBar: UISearchBar!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mBanner: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedData()
        mBanner.dropShadow()
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
        AF.request("http://localhost:9000/api/exam/list_exam", method: .get).responseJSON { (response) in
            
            switch response.result{
            case .success:
                
                do{
//                    print(response)
                    let result = try JSONDecoder().decode(ExamlistResponse.self, from: response.data!)
                    self.mDataArray = result.data
//                    var i:Int = 0
//                    for name in self.mDataArray {
//                        self.Exam_name[ i ] = name.examName
//                        i = i + 1
//                    }
        
                  self.mTableView.reloadData()
                    
                }catch{
                    
                }
                
            case .failure(let error):
                print("network error: \(error.localizedDescription)")
            }
            
            // 2 second
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                self.mRefresh.endRefreshing()
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
        } else {
             self.ID = item.examID
        }
        
        print(self.ID)
        
        let storyboard = AppStoryboard.Preparetoexam.instance.instantiateViewController(withIdentifier: "PrepareExam")
        navigationController?.pushViewController(storyboard, animated: true)
        
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
