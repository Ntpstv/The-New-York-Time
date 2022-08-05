//
//  SearchTableViewCell.swift
//  The New York Time
//
//  Created by Nattapat Soonthornvech on 04/08/2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet var labelFromSearch: UILabel!
    @IBOutlet var imageFromSearch: UIImageView!
    @IBOutlet var abstractLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDetail (bookDetail: Book){
        labelFromSearch.text = bookDetail.title
        abstractLabel.text = bookDetail.abstract
        imageFromSearch.imageFromUrl(urlString: bookDetail.multimedia.first?.url ?? "")
    }
}
