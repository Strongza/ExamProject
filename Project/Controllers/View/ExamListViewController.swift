import UIKit
import Alamofire

class ExamListViewController: UIViewController {

    let TitleArr = ["คณิตศาสตร์" , "วิทยาศาสตร์", "ชีววิทยา","คอมพิวเตอร์", "เคมี","ภาษาไทย","ภาษาอังกฤษ","NodeJS","JSON","Robot Framework","Git","Xcode","CocoaPod","Java","Spring Boot"]
    
    var mDataArray: [Datum] = []
    var Exam_name = [String]()
    var searchedTitle = [String]()
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
                    print(response)
                    let result = try JSONDecoder().decode(ExamlistResponse.self, from: response.data!)
                    self.mDataArray = result.data
//                    var i:Int = 0
//                    for name in self.mDataArray {
//                        self.Exam_name[ i ] = name.examName
//                        i = i + 1
//                    }
                    for i in 0..<self.mDataArray.count{
                        self.Exam_name.append(self.mDataArray[ i ].examName)
                    }
                    print(self.Exam_name)
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
        print(item)
        if searching {
            cell.mTextLabel.text = searchedTitle[indexPath.row]
        } else {
            cell.mTextLabel.text = item.examName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mDataArray[indexPath.row]
        if searching {
             self.ID = self.searchedTitle[indexPath.row]
        } else {
             self.ID = item.examID
        }

        print(ID)
        
        let storyboard = AppStoryboard.Preparetoexam.instance.instantiateViewController(withIdentifier: "PrepareExam")
        navigationController?.pushViewController(storyboard, animated: true)
        
    }
    
    
}


extension ExamListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedTitle = Exam_name.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        mTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        mTableView.reloadData()
    }
    
}
