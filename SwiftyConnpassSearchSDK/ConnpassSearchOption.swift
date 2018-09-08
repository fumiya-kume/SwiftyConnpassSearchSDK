//
//  ConnpassSearchOption.swift
//  SwiftyConnpassSearchSDK
//
//  Created by 久米史也 on 2018/09/04.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import Foundation

public class ConnpassSearchOption {
    
    var eventId: Int = -1
    var keyword: [String] = []
    var keywordOr: [String] = []
    var count: Int = -1
    // Ex 201708
    var ymDate: String?
    // Ex 20170831
    var ymdDate: String?
    var nickName: String?
    var ownerNickname: String?
    var seriesId: String?
    var startPosition: String?
    /*
     1: 更新日時順
     2: 開催日時順
     3: 新着順
     (初期値: 1)
     */
    var searchOrder: String?
    
    static internal func ToSearchQuery(searchOption: ConnpassSearchOption) -> String {
        var searchQuery = "?"
        
        searchQuery += searchOption.eventId != -1 ? "$event_id=\(searchOption.eventId)" : ""
        
        searchOption.keyword.forEach{ keyword in
            searchQuery += keyword != "" ? "&keyword=\(keyword)" : ""
        }
        
        searchOption.keywordOr.forEach{ keyword in
            searchQuery += keyword != "" ? "&keyword_or=\(keyword)" : ""
        }
        
        searchQuery += searchOption.count != -1 ? "&count=\(String(describing: searchOption.count))" : ""
        
        if let ym = searchOption.ymDate {
            searchQuery += "&ym=\(ym)"
        }
        
        if let ymd = searchOption.ymDate {
            searchQuery += "&ymd=\(ymd)"
        }
        
        if let name = searchOption.nickName {
            searchQuery += "&nickname=\(name)"
        }
        
        if let ownerName = searchOption.ownerNickname {
            searchQuery += "&owner_nickname=\(ownerName)"
        }
        
        if let id = searchOption.seriesId {
            searchQuery += "&series_id=\(id)"
        }
        
        if let start = searchOption.startPosition {
            searchQuery += "&start=\(start)"
        }
        
        if let order = searchOption.searchOrder {
            searchQuery += "&order=\(order)"
        }
        
        return searchQuery
    }
}
