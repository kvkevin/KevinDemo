//
//  HomeVC.swift
//  KevinDemo
//
//  Created by zm on 2018/9/28.
//  Copyright © 2018年 zm. All rights reserved.
//
import FBSDKCoreKit
import UIKit
import FBSDKShareKit

class HomeVC: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    var tv:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
//        initNavigationBar()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func initNavigationBar(){
//        let titleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 28))
//        titleView.image = #imageLiteral(resourceName: "nivTitle")
//        self.navigationItem.titleView = titleView
//        
//    }
    
    func initUI() {
        tv = UITableView()
        tv.frame = view.frame
        tv.delegate   =  self
        tv.dataSource = self
        view.addSubview(tv)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "homecell")
        cell.textLabel?.text = indexPath.row.description
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor  = UIColor.randomColor()
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AlertHelper.showToastWithMessage(message: indexPath.row.description)
        shareTofaceBook()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
//   应用编号： 260327591293004
//   应用秘钥：281c8627e906d4bbae09dd83d0ee8903
    
    func shareTofaceBook() {

        let photo = FBSDKSharePhoto ()

        photo.imageURL = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539583068818&di=6b2ff4d9e88f11c6a6e2478b19e3d0d2&imgtype=0&src=http%3A%2F%2Fwww.pptbz.com%2Fpptpic%2FUploadFiles_6909%2F201211%2F2012111719294197.jpg")
        let content  = FBSDKSharePhotoContent()
        content.photos = [photo]
        content.contentURL =  NSURL.init(string:"http://www.liangxinxin.xyz") as! URL
        let button = FBSDKSendButton()
        button.shareContent = content
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        self.view.addSubview(button)
     
        
    }
    
    
    

}
