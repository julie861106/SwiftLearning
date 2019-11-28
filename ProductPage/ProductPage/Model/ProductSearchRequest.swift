//
//  ProductSearchRequest.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/28.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import Foundation

enum ProductSearchError:Error{
    case noDataAvailable
    case canNotProcessData
}

//查詢
struct ProductSearchRequest {
    let resourcelURL: URL
    
    init(searchContent:String){
        let resourceString = "http://mindreaderapi.com/api/inventory/api/product/search/10/\(searchContent)"
        
        guard let resourcelURL = URL(string: resourceString) else {fatalError()}
        
        self.resourcelURL = resourcelURL
        
        
    }
    
    func getSearchProducts (completion: @escaping(Result<[ProductInfo], ProductSearchError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourcelURL){data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            print("看！\(jsonData)")
            
            do{
                let decoder = JSONDecoder()
                let productSearchResponse = try decoder.decode(ProductResponse.self, from: jsonData)
                
                let productResult = productSearchResponse.result
                completion(.success(productResult))
                
                
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
        
    }
    
    
}

