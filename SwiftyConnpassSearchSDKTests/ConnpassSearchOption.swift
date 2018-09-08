//
//  ConnpassSearchOption.swift
//  SwiftyConnpassSearchSDKTests
//
//  Created by 久米史也 on 2018/09/04.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import Foundation
import XCTest
@testable import SwiftyConnpassSearchSDK

class ConnpassSearchOptionTest: XCTestCase {
    
    func testイベントIDで検索できる() {
        
    }
    
    func test検索キーワードを指定する() {
        let parameters = [
            "?&keyword=hello":["hello"],
            "?&keyword=work":["work"],
            "?":[""],
            "?&keyword=hello&keyword=work":["hello","work"]
        ]
        parameters.forEach{
            let searchOption = ConnpassSearchOption()
            searchOption.keyword = $0.value
            XCTAssertEqual(
                $0.key,
                ConnpassSearchOption.ToSearchQuery(searchOption: searchOption)
            )
        }
    }
    
    func testOR検索キーワードを指定する() {
        let parameters = [
            "?&keyword_or=hello":["hello"],
            "?&keyword_or=work":["work"],
            "?":[""],
            "?&keyword_or=hello&keyword_or=work":["hello","work"]
        ]
        parameters.forEach{
            let searchOption = ConnpassSearchOption()
            searchOption.keywordOr = $0.value
            XCTAssertEqual(
                $0.key,
                ConnpassSearchOption.ToSearchQuery(searchOption: searchOption)
            )
        }
    }
    
    func test検索結果数を指定する() {
        let parametors = [
            "?&count=1":1,
            "?&count=2":2,
            "?&count=10":10,
            "?":-1,
            ]
        parametors.forEach{
            let searchOption = ConnpassSearchOption()
            searchOption.count = $0.value
            XCTAssertEqual(
                $0.key,
                ConnpassSearchOption.ToSearchQuery(searchOption: searchOption)
            )
        }
    }
}
