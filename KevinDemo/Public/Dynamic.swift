//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T)->Void
    var listener : Listener?
    
    func bindAndFire(listener : @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    func bind(listener : @escaping Listener) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(_ v: T) {
        value = v
    }
}
