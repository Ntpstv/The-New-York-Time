//
//  searchTableViewController.swift
//  The New York Time
//
//  Created by Nattapat Soonthornvech on 17/07/2022.
//

import UIKit
import CoreData
import Alamofire


class searchTableViewController: UITableViewController, NYTDataManagerDelegate{
    
    @IBOutlet var searchTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var nytDataManager = NYTDataManager()
    var nytItem = [Book]()
    var nytItemTemp = [Book]()
    
    
    func didUpdateNYT(_nytDataManager: NYTDataManager, Results: Book) {
        
    }
    
    func didFailWithError(error: Error) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.delegate = self
        getNYTItem()
        
    }
    func getNYTItem(){
        
        nytDataManager.fetchNYT() {(result) in
            switch result{
                
            case .success(let response):
                print(response)
                self.nytItem = response
                self.nytItemTemp = response
                
                self.searchTableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
//        FIXME: another way
//            case .failure():
//               break
                
            }
            
            
        }
    }
    
    // MARK: - Tableview data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nytItemTemp.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell {
            let item = nytItemTemp[indexPath.row]
            //FIXME: เป็นอีกท่าของการเรียกใช้
            //            cell.labelFromSearch.text = item.title
            //            cell.imageFromSearch.imageFromUrl(urlString: item.multimedia.first?.url ?? "")
            cell.setDetail(bookDetail: item)
            
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let item = nytItemTemp[indexPath.row]
        thirdVC.nytItem = item
        self.present(thirdVC, animated:true, completion:nil)
        
        //        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwindToMainVC", sender: self)
    }
    
    
}
//MARK: - searchBar methods

extension searchTableViewController: UISearchBarDelegate{
    
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
//        print("click")
//
//    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            nytItemTemp = nytItem
        }else{
            nytItemTemp = nytItem.filter { $0.title.lowercased().contains(searchBar.searchTextField.text?.lowercased() ?? "") }
            
//            print("searching...")
            
        }
        self.tableView.reloadData()
        

    }
    
}




