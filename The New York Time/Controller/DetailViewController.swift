//
//  ListViewController.swift
//  The New York Time
//
//  Created by Nattapat Soonthornvech on 15/07/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
   
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
//    var picImage: UIImage?
    
//    var imageReceived = UIImage()
//    var name = "https://www.nytimes.com/2022/07/21/books/african-american-dictionary.html"
//    var selectedImage: String!
//    var nyt: NYTDataManager?
//    let manager = NYTDataManager()
    var nytItem: Book?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.imageFromUrl(urlString: nytItem?.multimedia.first?.url ?? "")
        topLabel.text = nytItem?.title
        bottomLabel.text = nytItem?.abstract
        
//       https://www.appypie.com/pass-data-between-view-controllers-swift-how-to?fbclid=IwAR0GwhaXBgAevs2BFNk0yxRi82uZn2NaTpx34wXd2PJ8bM313hlzu05tXRc
//        lifcycle, extension

        
    }
    
    @IBAction func backToMainButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindFromDetailVC", sender: self)
    }
    
    }


