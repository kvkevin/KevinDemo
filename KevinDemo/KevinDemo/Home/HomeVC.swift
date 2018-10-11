//
//  HomeVC.swift
//  KevinDemo
//
//  Created by zm on 2018/9/28.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit

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
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    

}
