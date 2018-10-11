//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit


let UserLanguage = "UserLanguage"

let AppleLanguages = "AppleLanguages"

class LanguageHelper: NSObject {
    
    static let shareInstance = LanguageHelper()
    
    let def = UserDefaults.standard
    
    var bundle : Bundle?
    
    class func getString(key:String) -> String{
        
        let bundle = LanguageHelper.shareInstance.bundle
        
        let str = bundle?.localizedString(forKey: key, value: nil, table: nil)
        
        return str!
        
    }
    
    func initUserLanguage() {
        
        var string:String = def.value(forKey: UserLanguage) as! String? ?? ""
        
        if string == "" {
            
            let languages = def.object(forKey: AppleLanguages) as? NSArray
            
            if languages?.count != 0 {
                
                let current = languages?.object(at: 0) as? String
                
                if current != nil {
                    
                    string = current!
                    
                    def.set(current, forKey: UserLanguage)
                    
                    def.synchronize()
                    
                }
                
            }
            
        }
        
        string = string.replacingOccurrences(of: "-CN", with: "")
        
        string = string.replacingOccurrences(of: "-US", with: "")
        
        var path = Bundle.main.path(forResource:string , ofType: "lproj")
        
        if path == nil {
            
            path = Bundle.main.path(forResource:"en" , ofType: "lproj")
            
        }
        
        bundle = Bundle(path: path!)
        
    }
    
    func setLanguage(langeuage:String) {
        
        let path = Bundle.main.path(forResource:langeuage , ofType: "lproj")
        
        bundle = Bundle(path: path!)
        
        def.set(langeuage, forKey: UserLanguage)
        
        def.synchronize()
        
    }
    
}

class LanguageController: UIViewController {
    
    var lab: UILabel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        NotificationCenter.default.addObserver(self, selector: #selector(LanguageController.changeLanguage), name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
        
        let button = UIButton(frame:CGRect(x:10, y:150, width:50, height:50))
        
        button.addTarget(self, action: #selector(LanguageController.changelangage2), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(button)
        
        button.backgroundColor = UIColor.red
        
        let button2 = UIButton(frame:CGRect(x:100, y:150, width:100, height:30))
        
        button2.addTarget(self, action: #selector(LanguageController.changelangage), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(button2)
        
        button2.backgroundColor = UIColor.green
        
        lab = UILabel.init(frame: .init(x: 10, y: 100, width: 300, height: 20))
        
        self.view.addSubview(lab!)
        
        //        lab.text = NSLocalizedString("GOOD_MORNING",comment:"default")
        
        lab?.text = LanguageHelper.getString(key: "GOOD_MORNING")
        
    }
    
    @objc func changeLanguage() -> Void {
        
        lab?.text = LanguageHelper.getString(key: "GOOD_MORNING")
        
    }
    
    @objc func changelangage() -> Void {
        
        LanguageHelper.shareInstance.setLanguage(langeuage: "en")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
        
    }
    
    @objc func changelangage2() -> Void {
        
        LanguageHelper.shareInstance.setLanguage(langeuage: "zh-Hans")
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
        
    }
    
}


