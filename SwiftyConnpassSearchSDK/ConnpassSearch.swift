//
//  HelloWorld.swift
//  SwiftyConnpassSearchSDK
//
//  Created by 久米史也 on 2018/08/26.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import Foundation

public class ConnpassSearch {
    
    public init() {
        
    }
    
    public func Search(searchOption: ConnpassSearchOption?, completion: ((ConnpassSearchResult) -> Void)?)  {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let result = ConnpassSearchResult()
        
        var searchQuery = ""
        
        if let option = searchOption {
            searchQuery += ConnpassSearchOption.ToSearchQuery(searchOption: option)
        }
        
        if let url = URL(string: "https://connpass.com/api/v1/event/?&format=json" + searchQuery){
            let task = session.dataTask(with: url){ Data, Response, Error in
                if let error = Error{
                    result.error = error
                    result.ErrorType = .ResponseError
                    
                    return
                }
                
                if let data = Data{
                    do{
                        let decorder = JSONDecoder()
                        decorder.keyDecodingStrategy = .convertFromSnakeCase
                        decorder.dateDecodingStrategy = .iso8601
                        result.Data = try decorder.decode(ConnpassSearchResponse.self, from: data)
                    } catch {
                        result.ErrorType = .JsonParseError
                    }
                }
                
                completion?(result)
            }
            
            task.resume()
        }
    }
}
