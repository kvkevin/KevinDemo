//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation

 //MARK: 扩展Array  ==kevin注释==
extension Array {
    ///指定内容过滤去重
    func filterDuplicates<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        for value in self {
            let key = filter(value)
            if !result.map({filter($0)}).contains(key) {
                result.append(value)
            }
        }
        return result
    }
    

}

extension Sequence where Iterator.Element : Hashable {
    ///去重
    func unique() -> [Iterator.Element] {
        var seen : Set<Iterator.Element> = []
        return filter{
            if seen.contains($0){ return false}
            else {
                seen.insert($0)
                return true
            }
        }
    }
}



extension Dictionary where Key: ExpressibleByStringLiteral, Value :Any {
    var jsonString:String {
        do {
            let stringData = try JSONSerialization.data(withJSONObject: self as NSDictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let string = String(data: stringData, encoding: String.Encoding.utf8){
                return string
            }
        } catch _ {
            
        }
        return ""
    }
}


