//
//  UIView_Category.swift
//  Project
//
//  Created by Jefery on 2020/7/29.
//  Copyright © 2020 BDesign.com. All rights reserved.
//

import UIKit

extension UIView {
    public func isShowingnKeyWindow() -> Bool {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return false
        }
        //以主窗口的左上角为原点, 计算self的矩形框(谁调用这个方法这个self就是谁)
        let frame = keyWindow.convert(self.frame, from: self.superview)
        //判断主窗口的bounds和self的范围是否有重叠
        let isIntersects = frame.intersects(keyWindow.bounds)
        return isIntersects && !self.isHidden && self.alpha > 0 && self.window == keyWindow
    }
}


extension UIView {
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var temp: CGRect = frame
            temp.origin.x = newValue
            frame = temp
        }
    }
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var temp: CGRect = frame
            temp.origin.y = newValue
            frame = temp
        }
    }
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            var temp: CGRect = frame
            temp.size.width = newValue
            frame = temp
        }
    }
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            var temp: CGRect = frame
            temp.size.height = newValue
            frame = temp
        }
    }
    var left: CGFloat {
        get {
            return x
        }
        set(newValue) {
            x = newValue
        }
    }
    var right: CGFloat {
        get {
            return x + width
        }
        set(newValue) {
            x = newValue - width
        }
    }
    var top: CGFloat {
        get {
            return y
        }
        set(newValue) {
            y = newValue
        }
    }
    var bottom: CGFloat {
        get {
            return y + height
        }
        set(newValue) {
            y = newValue - height
        }
    }
//    var center: CGPoint {
//        get {
//           return CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
//        }
//        set(newValue) {
//           center = CGPoint(x: newValue.x, y: newValue.y)
//        }
//    }
    //中心点x
    var centerX : CGFloat {
        get {
            return center.x
        }

        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    //中心点y
    var centerY : CGFloat {
        get {
            return center.y
        }
        
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
}

extension UIView {
    
    /// 一次添加多个子控件
    func addSubViews(subviews:[UIView]) {
        for view in subviews {
            addSubview(view)
        }
    }
    
    /// 找到当前控件所在的控制器
    func getCurrentViewController() -> UIViewController? {
        var nextResponder = next
        repeat {
            let isVC = nextResponder?.isKind(of: UIViewController.self)
            if isVC != nil {
                return nextResponder as? UIViewController
            }
            nextResponder = nextResponder?.next
        }while (nextResponder != nil)
        return nil
    }
    
    /// 生成UIView的一张图片
    func takeSnapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}

