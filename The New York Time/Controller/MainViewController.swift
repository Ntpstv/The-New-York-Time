//
//  ListViewController.swift
//  The New York Time
//
//  Created by Nattapat Soonthornvech on 15/07/2022.
//

import UIKit
import Alamofire
import AlamofireImage
//import SwiftUI

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    
    private var search: [Results] = []
    
    let manager = NYTDataManager()
    var nytItem = [Book]()
    var mainCellCollectionViewCell = MainCellCollectionViewCell()
    var imageURL = "https://www.nytimes.com/2022/07/21/books/african-american-dictionary.html"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetchNYT(){(result) in
            switch result{
                
            case .success(let response):
                print(response)
                self.nytItem = response
                
                
                self.mainCollectionView.reloadData()
                
            case .failure(_):
                break
                
            }

        }

    }
    @IBAction func unwindSegueFromSearchTableVC(segue: UIStoryboardSegue){
        
    }
    @IBAction func unwindSegueFromDetailVC(segue: UIStoryboardSegue){
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return nytItem.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCellCollectionViewCell
        if indexPath.row < nytItem.count{
            
            let nytItemTemp = nytItem[indexPath.row]
            cell.setView(bookDetail: nytItemTemp)
            return cell
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
        secondVC.nytItem = nytItem[indexPath.row]
        //        secondVC.detailImageView = imageReceived.imageFromUrl(urlString: imageURL.multimedia.first?.url ?? "")
        //        secondVC.topLabel = nytItem[indexPath.row.title]
        //
        //
        self.present(secondVC, animated:true, completion:nil)
        }
    }
 
}

