//
//  NYTData.swift
//  The New York Time
//
//  Created by Nattapat Soonthornvech on 16/07/2022.
//

import Foundation


struct Results: Codable {
    let results: [Book]
}
struct Book: Codable {
    
    let section: String
    let title: String
    let multimedia: [Multimedia]
    let abstract: String
    
// FIXME: Dictionary -manual way
//    func convertToJSON(book: Book) -> [String: Any]{
//        var dict = [String: Any]()
//        dict["section"] = section
//        var a = ""
//        if let sectionTemp = dict["section"] as? String {
//            a = sectionTemp
//        }
//        return dict
//    }
    
    
}

struct Multimedia: Codable {
    let url: String
}
//FIXME: main classic model
//class Item {
//    var list: String = ""
//    var done: Bool = false
//     init(){
//
//    }
//    init(list: String, done: Bool){
//        self.list = list
//       self.done = done
//    }
//}
