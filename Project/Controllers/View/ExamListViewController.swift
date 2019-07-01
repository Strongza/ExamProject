import UIKit

class ExamListViewController: UIViewController {

    let TitleArr = ["คณิตศาสตร์" , "วิทยาศาสตร์", "ชีววิทยา","คอมพิวเตอร์", "เคมี","ภาษาไทย","ภาษาอังกฤษ","NodeJS","JSON","Robot Framework","Git","Xcode","CocoaPod","Java","Spring Boot"]
    
    var searchedTitle = [String]()
    var searching = false
    var ID: String = ""
    
    @IBOutlet weak var mSearchBar: UISearchBar!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mBanner: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

extension ExamListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedTitle.count
        } else {
            return TitleArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExamListTableViewCell
        if searching {
            cell.mTextLabel.text = searchedTitle[indexPath.row]
        } else {
            cell.mTextLabel.text = TitleArr[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searching {
             self.ID = self.searchedTitle[indexPath.row]
        } else {
             self.ID = self.TitleArr[indexPath.row]
        }

        print(ID)
        
        let storyboard = AppStoryboard.Preparetoexam.instance.instantiateViewController(withIdentifier: "PrepareExam")
        navigationController?.pushViewController(storyboard, animated: true)
        
    }
    
    
}


extension ExamListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedTitle = TitleArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        mTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        mTableView.reloadData()
    }
    
}
