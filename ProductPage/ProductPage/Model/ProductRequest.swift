//
//  ProductRequest.swift
//  ProductPage
//
//  Created by Julie Yao on 2019/11/27.
//  Copyright © 2019 DingLinLin. All rights reserved.
//

import Foundation

enum ProductError:Error{
    case noDataAvailable
    case canNotProcessData
}

struct ProductRequest {
    let resourcelURL: URL
    
    init(type:String){
        let resourceString = "http://mindreaderapi.com/api/inventory/7970a348a58ed2320a62a3156061b926/api/product/3/\(type)"
        
        guard let resourcelURL = URL(string: resourceString) else {fatalError()}
        
        self.resourcelURL = resourcelURL
        
        
    }
    
    func getProducts (completion: @escaping(Result<[ProductInfo], ProductError>) -> Void) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = .infinity
        let urlSession = URLSession(configuration: configuration)
        // TODO : let timeout infinity!!!
        // ref : https://medium.com/@jerrywang0420/urlsession-%E6%95%99%E5%AD%B8-swift-3-ios-part-3-34699564fb12
        let dataTask = URLSession.shared.dataTask(with: resourcelURL){data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            print("看！\(jsonData)")
            
            do{
                let decoder = JSONDecoder()
                let productResponse = try decoder.decode(ProductResponse.self, from: jsonData)
                
                let productResult = productResponse.result
                completion(.success(productResult))
                
                
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
        
    }
    
    
}


