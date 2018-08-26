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
    let events: [Event]?
    let resultsStart, resultsAvailable: Int?
}

struct Event: Decodable {
    let event_url: String?
    let eventType: EventType?
    let ownerNickname: String?
    let series: Series?
    let updatedAt: Date?
    let lat: String?
    let startedAt: Date?
    let hashTag, title: String?
    let eventID: Int?
    let lon: String?
    let waiting: Int?
    let limit: Int?
    let ownerID: Int?
    let ownerDisplayName, description: String?
    let address: String?
    let eventCatch: String?
    let accepted: Int?
    let endedAt: Date?
    let place: String?
}

enum EventType:String, Codable {
    case participation
}

struct Series: Decodable {
    let url: String?
    let id: Int?
    let title: String?
}
