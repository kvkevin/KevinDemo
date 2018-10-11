//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit
extension UITableViewCell {
    //返回cell所在的UITableView
    func superTableView() -> UITableView? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let tableView = view as? UITableView {
                return tableView
            }
        }
        return nil
    }
}


extension UITableView {
    func scrollToBottom(animated: Bool = true) {
        
        if self.contentSize.height > bounds.size.height {
            let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
            setContentOffset(bottomOffset, animated: animated)
        }
        

    }
}

extension UICollectionViewCell{
    //返回cell所在的UITableView
    func superCollectionView() -> UICollectionView? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let c = view as? UICollectionView {
                return c
            }
        }
        return nil
    }
}


