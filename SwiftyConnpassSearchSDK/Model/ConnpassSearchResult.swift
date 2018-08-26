//
//  ConnpassSearchResult.swift
//  SwiftyConnpassSearchSDK
//
//  Created by 久米史也 on 2018/08/26.
//  Copyright © 2018年 久米史也. All rights reserved.
//

import Foundation

public class ConnpassSearchResult {
    var Data: ConnpassSearchResponse?
    var Status: Status = .Success
    var ErrorType: ErrorType = .None
    var error: Error? = nil
}

public enum Status {
    case Success
    case Failed
}

public enum ErrorType {
    case None
    case ResponseError
    case JsonParseError
    case Unknown
}
