//
//  SLImageView.swift
//  SLImageView
//
//  Created by Lukasz Szarkowicz on 13.04.2016.
//  Copyright © 2016 szarkowicz. All rights reserved.
//

import UIKit

class SLImageView: UIImageView {
    
    private let imageTag = 35012
    var fullscreenImageView: UIImageView!
    var closeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.userInteractionEnabled = true
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(showFullscreen))
        self.addGestureRecognizer(touchGesture)
    }
    
    private func createFullscreenPhoto() -> UIImageView {
        
        let tmpImageView = UIImageView(frame: self.frame)
        tmpImageView.image = self.image
        tmpImageView.contentMode = UIViewContentMode.ScaleAspectFit
        tmpImageView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        tmpImageView.tag = imageTag
        tmpImageView.alpha = 0.0
        tmpImageView.userInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideFullscreen))
        tmpImageView.addGestureRecognizer(tap)
        
        return tmpImageView
    }
    
    private func createLabel() -> UILabel {
        
        let label = UILabel(frame: CGRectZero)
        label.text = "Touch to hide"
        label.font = UIFont(name: "HelveticaNeue", size: 12.0)
        label.sizeToFit()
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor(white: 0.85, alpha: 1)
        label.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        label.alpha = 0.0
        
        return label
    }
    
    func showFullscreen() {
        
        let window = UIApplication.sharedApplication().windows.first!
        if window.viewWithTag(imageTag) == nil {
            
            self.fullscreenImageView = createFullscreenPhoto()
            self.closeLabel = createLabel()
            
            let labelWidth = window.frame.size.width
            let labelHeight = closeLabel.frame.size.height + 16
            self.closeLabel.frame = CGRectMake(0, window.frame.size.height - labelHeight, labelWidth, labelHeight)
            self.fullscreenImageView.addSubview(closeLabel)
            
            window.addSubview(self.fullscreenImageView)
            UIView.animateWithDuration(0.4, delay: 0.0, options: .CurveEaseInOut, animations: {
                
                self.fullscreenImageView.frame = window.frame
                self.fullscreenImageView.alpha = 1
                self.fullscreenImageView.layoutSubviews()
                
                self.closeLabel.alpha = 1
                }, completion: { _ in
            })
        }
    }
    
    func hideFullscreen() {
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: .CurveEaseInOut, animations: {
            
            self.fullscreenImageView?.frame = self.frame
            self.fullscreenImageView?.alpha = 0
            
            }, completion: { finished in
                
                self.fullscreenImageView?.removeFromSuperview()
                self.fullscreenImageView = nil
        })
    }
    
}
