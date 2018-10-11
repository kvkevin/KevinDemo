//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import UIKit


extension UIImage
{
    static func solidColor(color:UIColor, width:CGFloat = 30.0, height:CGFloat = 30) -> UIImage
    {
        let imageSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(imageSize, false,  UIScreen.main.scale)
        color.set()
        
        UIRectFill(CGRect(x:0, y:0, width:imageSize.width, height:imageSize.height));
        let pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return pressedColorImg!
    }
    
    //改变导航条颜色的方法：
    static func imageWithBgColor(color:UIColor,height:CGFloat) -> UIImage {
        
        let rect  = CGRect(x:0.0, y:0.0, width:1.0, height:height)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        
        context.fill(rect)
        
        let image :UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
    
    static func nim_fetchImage(imageNameOrPath:String) -> UIImage{
        
        var image = UIImage(named: imageNameOrPath)
        if (image == nil) {
            image = UIImage(contentsOfFile: imageNameOrPath)
        }
        return image!
        
    }
    
    
    static func fixOrientation(aImage: UIImage) -> UIImage {
        
        if aImage.imageOrientation == .up {
            return aImage
        }
        var transform: CGAffineTransform = CGAffineTransform.identity
        switch aImage.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(M_PI))
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.rotated(by: CGFloat(M_PI_2))
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: aImage.size.height)
            transform = transform.rotated(by: CGFloat(-M_PI_2))
        default:
            break
        }
        
        switch aImage.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: aImage.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: aImage.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }
        
        let ctx: CGContext = CGContext(data: nil, width: Int(aImage.size.width), height: Int(aImage.size.height), bitsPerComponent: aImage.cgImage!.bitsPerComponent, bytesPerRow: 0, space: aImage.cgImage!.colorSpace!, bitmapInfo: aImage.cgImage!.bitmapInfo.rawValue)!
        ctx.concatenate(transform)
        switch aImage.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored: break
            // Grr...
            
            
            
            //            draw(in: CGRect(x: 0, y: 0, width: aImage.size.height, height: aImage.size.width));
        //            CGContextDrawImage(ctx, CGRectMake(0, 0, aImage.size.height, aImage.size.width), aImage.cgImage)
        default: break
            //            draw(in: CGRect(x: 0, y: 0, width: aImage.size.width, height: aImage.size.width));
            //            CGContextDrawImage(ctx, CGRectMake(0, 0, aImage.size.width, aImage.size.height), aImage.cgImage)
        }
        
        let cgimg: CGImage = ctx.makeImage()!
        let img: UIImage = UIImage(cgImage: cgimg)
        return img
    }
    
    
    
    convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage!)!)
    }
    

    
}

