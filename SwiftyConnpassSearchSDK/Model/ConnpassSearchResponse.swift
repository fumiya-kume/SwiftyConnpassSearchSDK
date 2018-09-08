//
//  ConnpassSearchResult.swift
//  SwiftyConnpassSearchSDK
//
//  Created by 久米史也 on 2018/08/26.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import Foundation

public struct ConnpassSearchResponse: Decodable {
    let resultsReturned: Int?
    let resultsAvailable: Int?
    let resultsStart: Int?
    let events: [Event]?
    
}

struct Event: Decodable {
    let eventId: Int?
    let title: String?
    let `catch`: String?
    let description: String?
    let eventUrl: String?
    let hashTag: String?
    let startedAt: Date?
    let endedAt: Date?
    let limit: Int?
    let eventType: EventType?
    let address: String?
    //    let event_url: String?
    //    let ownerNickname: String?
    //    let series: Series?
    //    let updatedAt: Date?
    //    let lat: String?
    //    let startedAt: Date?
    //    let hashTag, title: String?
    //    let lon: String?
    //    let waiting: Int?
    //    let limit: Int?
    //    let ownerID: Int?
    //    let ownerDisplayName, description: String?
    //    let address: String?
    //    let eventCatch: String?
    //    let accepted: Int?
    //    let endedAt: Date?
    //    let place: String?
}

enum EventType:String, Codable {
    case participation
    case advertisement
}

struct Series: Decodable {
    let url: String?
    let id: Int?
    let title: String?
}
