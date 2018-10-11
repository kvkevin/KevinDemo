//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit
extension Data{
    var hexString:String{
        return withUnsafeBytes {(bytes: UnsafePointer<UInt8>) -> String in
            let buffer = UnsafeBufferPointer(start: bytes, count: count)
            return buffer.map {String(format: "%02hhx", $0)}.reduce("", { $0 + $1 })
        }
    }
}
//MARK: String扩展  ==kevin注释==
extension String{
    //判断字符串是否是空
    func isEmpty() -> Bool {
        if(self.isEmpty){
            return true;
        }
        else {
            if(self.characters.count>0){
                return false
            }
            else {
                return true
            }
        }
    }
    //在固定宽度的情况下，获取文字的Size
    //    func  sizeOfString (constrainedToWidth width: CGFloat, attributes : [String: AnyObject]?) -> CGSize {
    //        return  NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
    //                                                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
    //                                                    attributes: attributes,
    //                                                    context: nil).size
    //
    //
    //
    //    }
    func sizeOfString(font:UIFont,maxSize:CGSize) -> CGSize{
        let attrs = [NSAttributedString.Key.font : font];
        //        let fixSize = CGSize(width: maxSize.width - 10, height: maxSize.height)
        return NSString(string: self).boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs, context: nil).size
    }
    //字符串进行MD5加密，返回小写32位
    
    
    //判断是不是电话号
    func isPhone()->Bool
    {
        let regex = try! NSRegularExpression(pattern: "^1[0-9]{10}$",
                                             options: [.caseInsensitive])
        
        return regex.firstMatch(in: self, options:[],
                                range: NSMakeRange(0, utf16.count)) != nil
    }
    
    
    func nsRange(from range: Range<String.Index>) -> NSRange? {
        
        let utf16view = self.utf16
        
        if let from = range.lowerBound.samePosition(in: utf16view), let to = range.upperBound.samePosition(in: utf16view) {
            
            return NSMakeRange(utf16view.distance(from: utf16view.startIndex, to: from), utf16view.distance(from: from, to: to))
            
        }
        
        return nil
        
    }
    
    
    func findFirstLetter() -> String {
        // 注意,这里一定要转换成可变字符串
        let mutableString = NSMutableString.init(string: self)
        // 将中文转换成带声调的拼音
        CFStringTransform(mutableString as CFMutableString, nil, kCFStringTransformToLatin, false)
        // 去掉声调(用此方法大大提高遍历的速度)
        let pinyinString = mutableString.folding(options: String.CompareOptions.diacriticInsensitive, locale: NSLocale.current)
        // 将拼音首字母装换成大写
        let strPinYin = polyphoneStringHandle(nameString: self, pinyinString: pinyinString).uppercased()
        // 截取大写首字母
        let firstString = String(strPinYin.prefix(1))
        //        let firstString = strPinYin.substring(to: strPinYin.index(strPinYin.startIndex, offsetBy:1))
        // 判断姓名首位是否为大写字母
        let regexA = "^[A-Z]$"
        let predA = NSPredicate.init(format: "SELF MATCHES %@", regexA)
        return predA.evaluate(with: firstString) ? firstString : "#"
    }
    
    //多音字处理，根据需要添自行加
    func polyphoneStringHandle(nameString: String, pinyinString: String) -> String {
        if nameString.hasPrefix("长") {return "chang"}
        if nameString.hasPrefix("沈") {return "shen"}
        if nameString.hasPrefix("厦") {return "xia"}
        if nameString.hasPrefix("地") {return "di"}
        if nameString.hasPrefix("重") {return "chong"}
        if nameString.hasPrefix("何") {return "he"}
        return pinyinString
    }
    
    
    //获取纯数字
    var numbersOnly: String {
        
        let numbers = self.replacingOccurrences(
            of: "[^+0-9]",
            with: "",
            options: .regularExpression,
            range:nil)
        return numbers
    }
    
    func  sizeOfString (constrainedToHeight height: CGFloat, attributes : [NSAttributedString.Key: Any]?) -> CGSize {
        return NSString(string: self).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height),
                                                   options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                   attributes:attributes,
                                                   context: nil).size
    }
    
    
    
    func cutout(Start:Int,longth:Int) ->String{
        //        let startindex = self.index(self.startIndex, offsetBy: 0)
        //        let endindx = self.index(index, offsetBy: 8)
        
        let startIndex = self.index(self.startIndex, offsetBy:Start)
        let endIndex = self.index(startIndex, offsetBy:longth)
        let result = self.substring(with:startIndex..<endIndex)
        return result
    }
    var transDateMonth : String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: self)
        formatter.dateFormat = "MMM"
        if let date = date {
            return formatter.string(from: date)
        }
        return ""
        
    }
    
    var transDateDay : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: self)
        formatter.dateFormat = "dd"
        if let date = date {
            return formatter.string(from: date)
        }
        return ""
        
    }
    
    var transDate : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = formatter.date(from: self)
        formatter.dateFormat = "MMMM dd, EEEE HH:mm"
        if let date = date {
            return formatter.string(from: date)
        }
        return ""
        
    }
    
    
    /// 格式化输出fullname 以空格代替!@#
    var formatFullName : String {
        var name = self
        if name.contains("!@#") {
            name = name.replacingOccurrences(of: "!@#", with: " ")
        }
        return name.appending(" ")
    }
    
    
    /// 以!@#分离 fullname
    var seperationFullName : [String]{
        let name = self
        var nameArray = [String]()
        
        if name.contains("!@#") {
            nameArray = name.components(separatedBy: "!@#")
        }else {
            nameArray = [name,""]
        }
        
        return nameArray
    }
    
    ///将秒数转换为 小时：分钟    eg. "3600" =》  "01:00" (1小时22分钟)
    var transToHourMinFormat : String? {
        let allTime: Int = Int(Double(self) ?? 0)
        var hours = 0
        var minutes = 0
        var hoursText = ""
        var minutesText = ""
        hours = allTime / 3600
        hoursText = hours > 9 ? "\(hours)" : "0\(hours)"
        minutes = allTime % 3600 / 60
        minutesText = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        return "\(hoursText):\(minutesText)"
    }
    
    ///将秒数转换为 hr m    eg. "3600 " =》  "1hr 0m" (1小时22分钟)
    var transToHourMinFormatFit : String {
        let allTime: Int = Int(Double(self) ?? 0) * 60
        var hours = 0
        var minutes = 0
        var hoursText = ""
        var minutesText = ""
        hours = allTime / 3600
        hoursText = hours > 9 ? "\(hours)" : "\(hours)"
        minutes = allTime % 3600 / 60
        minutesText = minutes > 9 ? "\(minutes)" : "\(minutes)"
        return hours > 0 ? "\(hoursText)hr \(minutesText)m" : "\(minutesText)m"
    }
    
    
    /// 几分钟前 几天前
    var updateTimeToCurrentTime : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: self) else { return "" }
        let timeSta:TimeInterval = date.timeIntervalSince1970
        return timeSta.updateTimeToCurrentTime
    }
    //MARK: 将时间戳转换为几天前，几分钟前  ==kevin注释==
    var updateTimeStampToCurrentTime:String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeInterval:TimeInterval = TimeInterval(self)!
        let date = Date(timeIntervalSince1970: timeInterval)
        return  formatter.string(from: date).updateTimeToCurrentTime
    }
    
    
}

extension TimeInterval  {
    var formatDate : String {
        let timeSta : TimeInterval = TimeInterval(self)
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = Date(timeIntervalSince1970: timeSta)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
        
    }
    
    
    
    /// 几分钟前 几天前
    var updateTimeToCurrentTime : String {
        //获取当前的时间戳
        let currentTime = Date().timeIntervalSince1970
        //        print(currentTime,   self, "sdsss")
        //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
        let timeSta:TimeInterval = TimeInterval(self)
        //时间差
        let reduceTime : TimeInterval = currentTime - timeSta
        //时间差小于60秒
        if reduceTime < 60 {
            return "just now"
        }
        //时间差大于一分钟小于60分钟内
        let mins = Int(reduceTime / 60)
        if mins < 60 {
            return "\(mins)m ago"
        }
        let hours = Int(reduceTime / 3600)
        if hours < 24 {
            return "\(hours)h ago"
        }
        let days = Int(reduceTime / 3600 / 24)
        if days < 30 {
            return "\(days)d ago"
        }
        //不满足上述条件---或者是未来日期-----直接返回日期
        let date = NSDate(timeIntervalSince1970: timeSta)
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="MM-dd"
        return dfmatter.string(from: date as Date)
    }
}
