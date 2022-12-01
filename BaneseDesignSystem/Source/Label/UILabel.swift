//
//  UILabel.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 21/10/22.
//

import Foundation
import UIKit

public class BDSUILabel: UILabel {
    
    //MARK: LifeCycle
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //MARK: Initialize Functions
    internal func setProperties(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment?) {
        self.font = font
        self.textColor = textColor
        
        if let alignment = textAlignment {
            self.textAlignment = alignment
        }
    }
    
    //MARK: Public Methods
    func fadeIn(_ duration : TimeInterval, completion: ((Bool) -> Swift.Void)? = nil) {
        self.alpha = 0
        self.isHidden = false
        
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    
    func fadeOut(_ duration : TimeInterval, completion: ((Bool) -> Swift.Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }, completion: completion)
    }
}
