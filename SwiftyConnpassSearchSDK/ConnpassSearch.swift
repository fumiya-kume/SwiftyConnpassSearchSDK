//
//  HelloWorld.swift
//  SwiftyConnpassSearchSDK
//
//  Created by 久米史也 on 2018/08/26.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import Foundation

public class ConnpassSearch {
    public func Search(keyword: String, completion: ((ConnpassSearchResult) -> Void)?)  {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let result = ConnpassSearchResult()
        
        if let url = URL(string: "https://connpass.com/api/v1/event/?keyword=" + keyword){
            let task = session.dataTask(with: url){ Data, Response, Error in
                if let error = Error{
                    result.error = error
                    result.ErrorType = .ResponseError
                    
                    return
                }
                
                if let data = Data{
                    do{
                        result.Data = try JSONDecoder().decode(ConnpassSearchResponse.self, from: data)
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
