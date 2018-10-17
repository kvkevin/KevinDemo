//
//  MineVC.swift
//  KevinDemo
//
//  Created by zm on 2018/9/28.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit
import Social
import FBSDKLoginKit
class MineVC: BaseViewController,FBSDKSharingDelegate {
    func sharer(_ sharer: FBSDKSharing!, didCompleteWithResults results: [AnyHashable : Any]!) {
        print("-----")
    }
    
    func sharer(_ sharer: FBSDKSharing!, didFailWithError error: Error!) {
        print("+++++")
        print(error)
    }
    
    func sharerDidCancel(_ sharer: FBSDKSharing!) {
        print("取消分享")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func initUI() {

        let btnpost = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        btnpost.backgroundColor = UIColor.randomColor()
        self.view.addSubview(btnpost)
        btnpost.addTarget(self, action:#selector(MineVC.ShareToFaceBook), for:.touchUpInside)
    }
    

    @objc func shareTofaceBook() {
        
        let photo = FBSDKSharePhoto ()
        photo.image = UIImage(named: "nivTitle")
//        photo.imageURL = URL(string: "https://s3.cn-north-1.amazonaws.com.cn/data.s3.tagtalk.co/postpics/cn/146/561280553896502.06.png")
        let content  = FBSDKSharePhotoContent()
        content.photos = [photo]
        content.contentURL =  NSURL.init(string:"http://www.liangxinxin.xyz") as! URL
        let button = FBSDKSendButton()
        button.shareContent = content
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        button.center = view.center
//        self.view.addSubview(button)

        let dialog = FBSDKShareDialog()
        dialog.delegate = self
        dialog.fromViewController = self
        dialog.mode = FBSDKShareDialogMode.shareSheet
        dialog.shareContent = content
        dialog.show()
        FBSDKShareDialog.show(from: self, with: content, delegate: self)
        
        
//        let contents = FBSDKShareLinkContent()
//        contents.contentURL = NSURL.init(string:"http://www.liangxinxin.xyz") as! URL
//
        

    }
    
    
   @objc func post() {
    UIApplication.shared.openURL(URL(string: "fbapi")!)
//    loginWithFacebook()
    shareTofaceBook()
//        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeSinaWeibo){
//            // 2
//            if let controller = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo) {
//                // 3
//                controller.setInitialText("Testing Posting to Facebook")
//                // 4
//                self.present(controller, animated:true, completion:nil)
//            }
//        }
//        else {
//            // 3
//            print("no Facebook account found on device")
//        }
    }

    @objc func sharePhoto() {
        let content = FBSDKSharePhotoContent()
        let photo = FBSDKSharePhoto(image: UIImage(named: "testPhoto"), userGenerated: false)
//        let photo = FBSDKSharePhoto.init(image: UIImage(named: "testPhoto", userGenerated: false))
        content.contentURL =  NSURL.init(string:"http://www.liangxinxin.xyz") as! URL
        content.photos = [photo]
        
        let dialog = FBSDKShareDialog()
        dialog.delegate = self
        dialog.fromViewController = self
        dialog.mode = FBSDKShareDialogMode.shareSheet
        dialog.shareContent = content
        dialog.show()
        FBSDKShareDialog.show(from: self, with: content, delegate:nil)
        
        
    }
    
    
    
    
    
//通过facebook登录
func loginWithFacebook(){
    let faceBookLoginManger = FBSDKLoginManager()
    faceBookLoginManger.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) -> Void in
        if (error != nil){
            print("error is \(error)")
        }else if ((result?.isCancelled)!){
            
        }else{
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email"])
            graphRequest.start { (connection, result, error) -> Void in
                if ((error) != nil){
                    print("Error: \(error)")
                }else{
                    print("\(FBSDKAccessToken.current().tokenString)")
//                    print("\(result.valueForKey("id"))")
//                    print("\(result.valueForKey("name"))")
                }
            }
        }
    }
}
    
    
    
    
   @objc func ShareToFaceBook() {
        let imageArray =  [UIImage(named: "testPhoto")]
        let dic:NSMutableDictionary  = [:]
        dic.ssdkSetupShareParams(byText: "分享到facebook", images:imageArray, url: URL(string: "http://www.liangxinxin.xyz"), title: "kevin分享", type:SSDKContentType.image)
        dic.ssdkEnableUseClientShare()
    //无UI分享
    ShareSDK.share(.typeInstagram, parameters: dic) { (state, platformType, userData, error) in
        
        switch state{
        case .success:
            AlertHelper.showToastWithMessage(message: "分享成功")
        case .fail:
            AlertHelper.showToastWithMessage(message: "分享失败")
        default:
            AlertHelper.showToastWithMessage(message: "分享失败")
            break
    }
    }

       // 弹框分享
        ShareSDK.showShareActionSheet(nil, items: nil, shareParams: dic) { (state, platformType, userData, contentEntity, error,end) in
       /*回调处理*/
        }

    
    }
    
    
    
    
    
    

}
