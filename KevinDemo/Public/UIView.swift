//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit
 //MARK: UIViwew扩展  ==kevin注释==
extension UIView{
    //设置X坐标
    func  setX(x:CGFloat){
        var frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
    }
    //设置y坐标
    func setY(y:CGFloat){
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame;
    }
    
    //设置centerY
    func setCenterY(y:CGFloat) {
        let center = self.center
        self.center = CGPoint(x: center.x, y: y)
    }
    
    //设置centerX
    func setCenterX(x:CGFloat) {
        let center = self.center
        self.center = CGPoint(x: x, y: center.y)
    }
    
    //返回x坐标
    func getx() -> CGFloat {
        return self.frame.origin.x;
        
    }
    //返回y坐标
    func gety() -> CGFloat {
        return self.frame.origin.y;
    }
    //返回宽度
    func getWidth() -> CGFloat {
        return self.frame.size.width;
    }
    //返回高度
    func getHeight() -> CGFloat {
        return self.frame.height
    }
    
    func CGPointMake(width:CGFloat,height:CGFloat) -> CGSize {
        let size = CGSize(width: width, height: height)
        return size
    }
    
    func CGRectMake(x:CGFloat,y:CGFloat,width:CGFloat,heigth:CGFloat) -> CGRect {
        
        let rect = CGRect(x: x, y: y, width: width, height: heigth)
        return rect
        
    }
    func CGSizeMake(width:CGFloat,height:CGFloat) -> CGSize {
        let size = CGSize(width: width, height: height)
        return size
    }
    //加圆角
    func makeCornerRadius(radius:CGFloat){
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    //加边框
    func border(width:CGFloat){
        
        self.layer.borderWidth = width
    }
    //边框颜色
    func borderColor(color:UIColor){
        self.layer.borderColor = color.cgColor
        
    }
    //添加阴影
    func addShadow(width:CGFloat = 0, height: CGFloat = 5){
        self.layer.shadowOffset = CGSize(width: width, height:height)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 3
//        self.layer.masksToBounds = false
    }
    
    //返回该view所在VC
    func firstViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
     //MARK: 返回veiw的图片形式  ==kevin注释==
    func renderImage() -> UIImage {
        updateConstraintsIfNeeded(); layoutIfNeeded()
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        return renderer.image { _ in drawHierarchy(in: bounds, afterScreenUpdates: true) }
    }
        /**
         Get the view's screen shot, this function may be called from any thread of your app.
         - returns: The screen shot's image.
         */
    func screenShot() -> UIImage? {
            guard frame.size.height > 0 && frame.size.width > 0 else {
                return nil
            }
            UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
    
    //画一条线
    func drawLine(color:UIColor = UIColor.colorWithHex(hexValue: 0xF1F1F1),
                  start:CGPoint,
                  end:CGPoint) -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.lineWidth = 1
        shape.fillColor = color.cgColor
        shape.strokeColor = color.cgColor
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        shape.path = path.cgPath
        return shape
    }
}







