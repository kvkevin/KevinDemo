//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation

struct Errors {
    var code : Int = 0
    private(set) public var errormsg : String = ""
    var data : String = ""
    private var msg : String {
        switch code {
        case 0: return "ok"
        case 1: return "there is no such question in question list, please check question id"
        case 2: return "question has already been answered"
        case 3: return "Please note that this question was asked by yourself."
        case 4: return "this user has a question being answered"
        case 5: return "user refused accept friend failed"
        case 7: return "create new wine failed"
        case 8: return "input wine name is empty"
        case 9: return "input vintage is empty"
        case 10: return "add tasting profile failed"
        case 11: return "like tasting profile failed"
        case 12: return "get wine details failed"
        case 13: return "tid is empty, create chatting group failed"
        case 14: return "Redsip is updating information, please come back later"
        case 15: return "input case is empty"
        case 16: return "input existed_in_mysql is empty"
        case 17: return "wine score is not available"
        case 18: return "input uid is empty"
        case 19: return "get img by wine name failed"
        case 20: return "input post id is empty"
        case 21: return "get post details failed"
        case 22: return "input event id is empty"
        case 23: return "user bring wine failed"
        case 24: return "user has not joined event yet"
        case 99: return "gRPC does not get any data returned."

        default: return "other error"
        }
    }
    init(code:Int?,data:String? = "") {
        if let c = code {
            self.code = c
            self.errormsg = msg
            self.data = data ?? ""
        }
    }
}
