//
//  ConnpassSearch.swift
//  SwiftyConnpassSearchSDKTests
//
//  Created by 久米史也 on 2018/08/26.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import XCTest

@testable import SwiftyConnpassSearchSDK

class ConnpassSearchTest: XCTestCase {
    
    var response: ConnpassSearchResult? = nil
    
    
    override func setUp() {
        super.setUp()
        
        let connpassSearch = ConnpassSearch()
        let connpassAPIExpectation = expectation(description: "API レスポンスが返ってくるのを待機")
        
        let searchOption = ConnpassSearchOption()
        searchOption.keyword = ["Ruby"]
        
        connpassSearch.Search(searchOption: searchOption){ response in
            
            self.response = response
            
            connpassAPIExpectation.fulfill()
        }
        waitForExpectations(timeout: 6.0, handler: nil)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testリクエストを投げるとレスポンスが返ってくる() {
        XCTAssertNotNil(response)
        XCTAssertEqual(
            response?.Status,
            .Success
        )
    }
    
    func test検索結果のデータにアクセスすることができる() {
        XCTAssertNotNil(response?.Data)
    }
    
    func test返って来たイベントの数を取得することができる() {
        if let data = response?.Data {
            XCTAssertNotEqual(data.resultsReturned, 0)
        }
    }
    
    func test検索結果の総数を取得することができる() {
        if let data = response?.Data {
            XCTAssertNotNil(data.resultsAvailable)
            XCTAssertNotEqual(
                data.resultsAvailable,
                0
            )
            XCTAssertGreaterThan(
                data.resultsAvailable!,
                data.resultsReturned!
            )
        }
    }
    
    func test検索の初期位置を設定することができる() {
        if let data = response?.Data {
            XCTAssertNotNil(data.resultsStart)
            XCTAssertEqual(
                data.resultsStart!,
                1
            )
        }
    }
    
    func testイベントのリストを取得することができる() {
        if let data = response?.Data {
            XCTAssertNotNil(data.events)
            if let events = data.events {
                XCTAssertNotEqual(
                    events.count,
                    0
                )
            }
        }
    }
    
    func test返って来たイベントの数はイベントのリストの要素の数に等しい() {
        if let data = response?.Data {
            XCTAssertEqual(
                data.resultsReturned,
                data.events?.count
            )
        }
    }
    
    func testユニークなイベントIDを取得できる() {
        if let data = response?.Data, let events = data.events {
            events.map{$0.eventId}.forEach{XCTAssertNotNil($0)}
            let uniqueSets = NSOrderedSet(array: events.map{$0.eventId ?? 0})
            XCTAssertEqual(data.resultsReturned, uniqueSets.count)
        }
    }
    
    func testイベントタイトルを取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.title)}
            let uniqeueTitleSet = NSOrderedSet(array: events)
            XCTAssertEqual(response?.Data?.resultsReturned, uniqeueTitleSet.count)
        }
    }
    
    
    func testイベントの詳細を取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.description)}
        }
    }
    
    func testイベントページのURLを取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.eventUrl)}
            events.forEach{XCTAssertNotNil(URL(string: $0.eventUrl!)) }
        }
    }
    
    func testハッシュタグを取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.hashTag)}
        }
    }
    
    func test開始日時を取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.startedAt)}
        }
    }
    
    func test終了日時を取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.endedAt)}
        }
    }
    
    func testイベントタイプを取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.eventType)}
        }
    }
    
    func test開催場所を取得することができる() {
        if let events = response?.Data?.events {
            events.forEach{XCTAssertNotNil($0.address)}
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
}
