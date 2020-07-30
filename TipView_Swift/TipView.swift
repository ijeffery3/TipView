//
//  TipView.swift
//  Project
//
//  Created by Jefery on 2020/7/30.
//  Copyright © 2020 BDesign.com. All rights reserved.
//

import UIKit

class TipLabel: UIView {
    let contHeight = CGFloat(40.0)
    static let shared = TipLabel()
    var label : UILabel = {
       let label = UILabel()
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 14)
       label.textAlignment = .center
       return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.8);
        self.layer.cornerRadius = contHeight / 2
        self.addSubview(self.label)
        self.accessibilityViewIsModal = true
        self.superview?.clipsToBounds = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func showTipLabel(text: String, view: UIView) {
        DispatchQueue.main.async {
            TipLabel.shared.showView(text: text, view: view)
        }
    }
    
    func showView(text: String, view: UIView) {
        let width = self.labelWidth(text, 30)
        self.label.text = text;
        self.frame = CGRect(x: 0, y: -contHeight, width: width, height: contHeight)
        self.x = (kScreenWidth - width) / 2
        self.label.frame = self.bounds
        view.addSubview(self)
        self.showAnimate()
    }

    func showAnimate() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.y = 100
        }) { (comp) in
            
        };

        UIView.animate(withDuration: 0.4, delay: 2, options: .curveEaseInOut, animations: {
            self.y = -self.contHeight
        }) { (comp) in
            self.removeFromSuperview()
        };
    }
    
    func labelWidth(_ text: String, _ height: CGFloat) -> CGFloat {
        let size = CGSize(width: 2000, height: height)
        let font = UIFont(name: "PingFang-SC-Regular", size: 18)!
        let attributes = [NSAttributedString.Key.font: font]
        let labelSize = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        if labelSize.width < 50 {
            return 50
        }
        return labelSize.width + 5
    }
    
}
