//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//


import UIKit
import BlocksKit
import MBProgressHUD


enum AlertViewType : String {
    case Alert = "异常提示" /**<异常提示*/
    case Error = "错误提示" /**<错误*/
    case Prompt = "温馨提示" /**<温馨提示*/
}


//MARK: 用于提示框类  ==kevin注释==
class AlertHelper: NSObject {
//    private var loadingView : DemonRequestLoadingView?
    /**<单例模式*/
    //    class var sharedView: DemonAlertHelper {
    //        struct Static {
    //            static var instance : DemonAlertHelper?
    //            static var token : dispatch_once_t = 0
    //        }
    //
    //        dispatch_once(&Static.token) {
    //            Static.instance = DemonAlertHelper()
    //        }
    //        return Static.instance!
    //    }
    //
    static let sharedView :AlertHelper = {
        let instance = AlertHelper()
        return instance
    }()
    // MARK: - 加载等待层
    static func showRequestingView()
    {
        //        if DemonAlertHelper.sharedView.loadingView == nil
        //        {
        //
        //            DemonAlertHelper.sharedView.loadingView = DemonRequestLoadingView(frame: CGRect(x:0 ,y:0, width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height) )
        //
        //        }
        //
        //        if (DemonAlertHelper.sharedView.loadingView!.superview != nil)
        //        {
        //            return
        //        }
        //
        //        if DemonAlertHelper.sharedView.loadingView != nil
        //        {
        //            UIApplication.shared.keyWindow?.addSubview(DemonAlertHelper.sharedView.loadingView!)
        //          //  UIApplication.shared.windows.last?.addSubview(<#T##view: UIView##UIView#>)
        //        }
        //
        //
        //        DemonAlertHelper.sharedView.loadingView?.show()
//        ZYMBProgressHUD.showHUD();
        
    }
    
    /**
     关闭加载等待层
     */
    static func dissmissRequestView()
    {
        //        let delayTame = DispatchTime.now() + 0.01
        //        DispatchQueue.main.asyncAfter(deadline: delayTame) {
        //            DemonAlertHelper.sharedView.loadingView?.removeFromSuperview()
        //            DemonAlertHelper.sharedView.loadingView?.dissmiss()
        //        }
//        ZYMBProgressHUD.hideHUD()
    }
    // MARK: - HUD提示框
    /**
     显示提示
     - parameter message: 提示内容，可以用\n隔开
     - parameter view:    对应的view
     - 轻提示
     */
    static func showToastWithMessage(message:String, view:UIView = UIApplication.shared.windows.last! )
    {
        self.showHudWithMessage(message: message, view: view, delay: 1.7)
    }
    /**
     隐藏所有遮罩
     - parameter view: 可选
     */
    static func hideHudMessage(view:UIView = UIApplication.shared.windows.last!)
    {
        MBProgressHUD.hide(for: view, animated: true)
    }
    /**
     中间显示遮罩
     
     - parameter message: 内容
     - parameter view:    要添加的view
     */
    static func showHudWithMessage(message:String, view: UIView? = nil)
    {
        if view == nil
        {
            self.showHudWithMessage(message: message, view: UIApplication.shared.windows.last!)
        }else
        {
            let hud = MBProgressHUD.showAdded(to: view!, animated: true)
            if message.contains("\n")
            {
                let array = message.components(separatedBy: "\n")
                hud.label.text = array[0]
                hud.detailsLabel.text = array[1]
            }else
            {
                hud.label.text = message
            }
            
            
            //self.showHudWithMessage(message, view: view!, delay: 2.0)
        }
    }
    private  static func showHudWithMessage(message:String, view:UIView, delay:TimeInterval)
    {
        //    MBProgressHUD.hideAllHUDs(for: UIApplication.shared.keyWindow! , animated: false)
        MBProgressHUD.hide(for: UIApplication.shared.windows.last!, animated: false)
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        if message.contains("\n")
        {
            let array = message.components(separatedBy: "\n")
            hud.label.text = array[0]
            hud.detailsLabel.text = array[1]
        }else
        {
            hud.label.text = message
        }
        
        hud.label.font = UIFont.boldSystemFont(ofSize: 14.0)
        hud.margin = 12.0
        hud.offset.y = 150.0
        hud.mode = MBProgressHUDMode.text
        hud.removeFromSuperViewOnHide = true
        hud.isUserInteractionEnabled = false
        hud.hide(animated: true, afterDelay: delay)
    }
    // MARK: - 提示框
    /**
     显示弹出框, 无按钮
     - parameter title:           标题
     - parameter content:         内容
     - parameter dismissDuration: 消失持续时间
     - parameter type:            弹出框类型
     */
    static func showAlertWithTitle(title:String, content:String ,  type:AlertViewType ,dismissDuration:TimeInterval = 2)
    {
//        let alertView = DemonAlertView(title: title, content: content, type: type, alertButtonTitles: [], alertBlocks: [], alertColor: [])
//
//        alertView.showWithAnimation(animation: .FromFadeInOut)
//        alertView.bk_perform({ (obj) in
//            (obj as! DemonAlertView).dismissAlert()
//        }, afterDelay: dismissDuration
//        )
    }
    
    
    
    /**
     显示弹出框，仅包括内容， 仅有一个默认确定按钮
     
     - parameter type:      弹出框类型
     - parameter content:   弹出框显示内容
     - parameter doneBlock: 点击确定内容
     */
    static func showAlertWithOneButton(type:AlertViewType, content:String, title:String? = nil , buttonTitle:String = "确定", alertColor:UIColor = UIColor.colorWithHex(hexValue: 0xFB4747)  , doneBlock:(()->Void)? = nil )
    {
        
        var str:String
        if title == nil
        {
            switch (type) {
            case .Alert:
                str = "警告"
            case .Error:
                str = "错误"
            case .Prompt:
                str = "温馨提示"
            }
        }else
        {
            str = title!
        }
        
//        let alertView = DemonAlertView(title: str, content: content, type: type, alertButtonTitles: [buttonTitle], alertBlocks: [doneBlock], alertColor: [ alertColor ])
//        alertView.showWithAnimation(animation: .FromFadeInOut)
    }
    
    
    /**
     显示两个Button的情况
     */
    static func showAlertWithTwoButtons(isShowCloseButton:Bool = false , alertColor:[UIColor] = [UIColor.colorWithHex(hexValue: 0x999999), UIColor.colorWithHex(hexValue: 0xFB4747)],type:AlertViewType,title:String, content:String , buttonTitles : [String] ,   closeBlock:(()->Void)? = nil, alertBlocks :[(()->Void)?])
    {
//        let alertView = DemonAlertView(title: title, content: content, type: type, isShowCloseButton: isShowCloseButton, closeBlock: closeBlock, alertButtonTitles: buttonTitles, alertBlocks: alertBlocks, alertColor: alertColor)
//        alertView.showWithAnimation(animation: .FromFadeInOut)
        
    }
    
    static  func loadingAlert(){
        let HUD = MBProgressHUD.showAdded(to: UIApplication.shared.windows.last!, animated: true)
        HUD.label.text = "加载中..."
        HUD.backgroundView.style = .blur
        
    }
    
    static  func appleAlert(vc:UIViewController,title:String,message:String,cancle:@escaping ()->(),OK:@escaping ()->()){
        let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
        let cancle  = UIAlertAction(title: " Cancel".localized, style: .cancel) { (cancleAction) in
            cancle()
        }
        let okaction = UIAlertAction(title: "Ok".localized, style:.default) { (okAction) in
            OK()
        }
        alert.addAction(cancle)
        alert.addAction(okaction)
        vc.present(alert, animated: true, completion: nil)
        
    }
    static  func appleSheetAlert(vc:UIViewController,title:String,title1:String){
        let alert = UIAlertController(title:title, message:"message", preferredStyle: .actionSheet)
        let action = UIAlertAction(title:title1, style: .default) { (action) in
            print("acton1")
        }
        let action2 = UIAlertAction(title:title1, style: .default) { (action) in
            print("acton1")
        }
       let cancle = UIAlertAction(title: "取消", style:.cancel, handler: { (cancle) in
                print("取消")
            })
          alert.addAction(action)
          alert.addAction(cancle)
        vc.present(alert, animated: true, completion: nil)
    }

}

