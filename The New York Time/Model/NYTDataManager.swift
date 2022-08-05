//
//  NetworkManager.swift
//  The New York Time
//
//  Created by Nattapat Soonthornvech on 16/07/2022.
//

import Foundation
import Alamofire


protocol NYTDataManagerDelegate: AnyObject {
    func didUpdateNYT(_nytDataManager: NYTDataManager, Results: Book)
    func didFailWithError(error: Error)
}

struct NYTDataManager{
    
    var delegate: NYTDataManagerDelegate?
    var nytItem = [Book]()
    
    private let API_KEY = "GDrQ2aBDKGj6DELALg9H4JeXLysN1peW"
    
    func fetchNYT(completion: @escaping (Result<[Book], Error>)-> Void){
        
        //        func fetchNYT(completionHandler: @escaping (Result<[Book], Error>) -> Void){
        //            let query = Book.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? Book

        let urlString = "https://api.nytimes.com/svc/topstories/v2/books.json?api-key=\(API_KEY)"
        AF.request(urlString).responseDecodable(of: Results.self, queue: .main, decoder: JSONDecoder()) { (response) in
            
            switch response.result {
                
            case .success(let results):
                completion(.success(results.results))
                
            case .failure(let error):
                print("error: \(error)")
                
                completion(.failure(error))
            }
        }
    }
    
}


