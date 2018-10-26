//
//  BaseWebVC.swift
//  KevinDemo
//
//  Created by zm on 2018/10/18.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit
import WebKit
import SnapKit


class BaseWebVC: UIViewController,WKNavigationDelegate {
    
    
    var webUrl:String?//网页URL
    var webView:WKWebView =  WKWebView()//网页视图
    var progressView:UIProgressView = UIProgressView()//进度条
    var closeBtn:UIButton!//关闭按钮

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        //webview
        webView.backgroundColor = UIColor.mainColor
        webView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        self.view.addSubview(webView)

        webView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
        }
        //progressView
        view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(3)
            make.top.equalToSuperview()
        }
        progressView.tintColor = UIColor.mainColor
        progressView.isHidden = true
        
        //load url
        if webUrl != nil{
            
            webView.load(URLRequest(url: URL(string: webUrl ?? "")!))
            
        }

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.closeButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        self.closeBtn.removeFromSuperview()
//         webView.goBack()
    }
    
    func closeButton() {
        if self.closeBtn != nil{
            self.closeBtn = UIButton(frame: CGRect(x: 44, y: 0, width: 44, height: 44))
            self.closeBtn.setTitle("关闭", for:.normal)
            self.closeBtn.setTitleColor(UIColor.black, for:.normal)
            self.closeBtn.bk_addEventHandler({ (sender) in
                self.navigationController?.popViewController(animated: true)
            }, for: .touchUpInside)
            self.navigationController?.navigationBar.addSubview(self.closeBtn)
            
        }
    }
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //加载进度
        if keyPath == "estimatedProgress"{
            let newProgress = change?[.newKey] as! Float
            let oldProgress  = change?[.oldKey] as! Float ?? 0.0
            
            if newProgress < oldProgress{
                return
            }
            if newProgress == 1{
                progressView.isHidden  = true
                progressView.setProgress(0, animated: false)
                
            }else{
                progressView.isHidden = false
                progressView.setProgress(newProgress, animated: true)
            }
         
        }
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.isHidden  = true
        progressView.setProgress(0, animated: false)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        progressView.isHidden = true
        progressView.setProgress(0, animated: false)
       
    }
    
    
    
    
//
//        override func initVC() {
//
//                        webView.addObserver(self, forKeyPath:"estimatedProgress", options: NSKeyValueObservingOptions.new, context:nil)
//
//                        webView.navigationDelegate =self
//
//                }
//
//
//
//            deinit {
//
//                        webView.removeObserver(self, forKeyPath:"estimatedProgress")
//
//                        webView.navigationDelegate =nil
//
//                }

    

}
