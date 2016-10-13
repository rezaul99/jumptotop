//
//  floatingPoint.swift
//  bottomButton
//
//  Created by junaid on 10/2/16.
//  Copyright © 2016 junaid. All rights reserved.
//

import UIKit
import QuartzCore

enum FloatingColor {
    case red
    case pink
    case purple
    case blue
    case cyan
    case green
    case yellow
    case orange
    case brown

    
}

class JumpToTop: UIView,UIScrollViewDelegate {
   
    var floatingButton = SpringButton()
    let lastContentOffset:CGFloat = 0.0
    var isTopAnimationShown:Bool = false
    var isBottomAnimationShown:Bool = false

    func drawfloatingButton(addToView contentView:UIView, andTopView TopView:UIView, andColor color:FloatingColor = .red) {
        floatingButton.frame = CGRect(x:0,y:0,width:40,height:40)
        floatingButton.layer.cornerRadius = floatingButton.frame.size.width/2.0
        floatingButton.layer.borderColor = UIColor.blue.cgColor
        floatingButton.setImage(UIImage.init(named: "up_arrow"), for: .normal)
        floatingButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        floatingButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        floatingButton.setTitleColor(UIColor.white, for:.normal)
        floatingButton.backgroundColor = UIColor.init(colorLiteralRed: 0.19, green: 0.25, blue: 0.62, alpha: 1.0)
        floatingButton.layer.masksToBounds = false
        floatingButton.layer.shadowColor = UIColor.gray.cgColor
        floatingButton.layer.shadowOpacity = 0.4;
        floatingButton.layer.shadowRadius = 3;
        floatingButton.layer.shadowOffset = CGSize(width:3.0,height:3.0)
        floatingButton.alpha = 0.0
        contentView.addSubview(floatingButton)
        positionFloatingButton(contentView: TopView)
        changeColor(color: color)
        
    }
    func positionFloatingButton(contentView:UIView) {
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: floatingButton, attribute:.trailing, relatedBy: NSLayoutRelation.equal, toItem:contentView, attribute:.trailing, multiplier: 1, constant: -10)
        contentView.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: floatingButton, attribute:.bottom, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute:.bottom, multiplier: 1, constant: -10)
        contentView.addConstraint(verticalConstraint)
        
        let widthConstraint = NSLayoutConstraint(item: floatingButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        floatingButton.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: floatingButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        floatingButton.addConstraint(heightConstraint)
    }
    
    func  scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentLocation = scrollView.contentOffset.y
        if currentLocation > 115 {
            if isBottomAnimationShown == false {
                floatingButton.alpha = 1.0
                floatingButton.animation = "slideUp"
                floatingButton.animate()
                isBottomAnimationShown = true
            }
            
        }
        else if  currentLocation <= 5.0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.isBottomAnimationShown = false
                self.floatingButton.alpha = 0.0
            })
        }
    }
    
    func changeColor(color:FloatingColor) {
        switch color {
        case .red:
            floatingButton.backgroundColor = UIColor(red:0.96, green:0.26, blue:0.21, alpha:1.0)
        case .pink:
            floatingButton.backgroundColor = UIColor(red:0.91, green:0.12, blue:0.39, alpha:1.0)
        case .purple:
            floatingButton.backgroundColor = UIColor(red:0.61, green:0.15, blue:0.69, alpha:1.0)
        case .blue:
            floatingButton.backgroundColor = UIColor(red:0.10, green:0.14, blue:0.49, alpha:1.0)
        case .cyan:
            floatingButton.backgroundColor = UIColor(red:0.00, green:0.74, blue:0.83, alpha:1.0)
        case .green:
            floatingButton.backgroundColor = UIColor.green
        case .yellow:
            floatingButton.backgroundColor = UIColor.yellow
        case .orange:
            floatingButton.backgroundColor = UIColor.orange
        case .brown:
            floatingButton.backgroundColor = UIColor.brown
        }
    }
    
}
