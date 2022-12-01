//
//  UIButton.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 20/10/22.
//

import UIKit

public class BDSUIButton: BDSBaseButton {
    public enum POPUIButtonType {
        case solid, outline, outlineLight, secondary
    }
    
    //MARK: Functions
    override func customConfigs() {
        disabledTintColor = BDSColor().grayScale20
        disabledBorderColor = BDSColor().grayScale90.cgColor
    }
    
    public func setup(buttonType: POPUIButtonType) {
        switch buttonType {
        case .solid:
            defaultBackgroundColor = BDSColor().backGroundPrimary
            defaultTintColor = BDSColor().brandSecondary
            defaultBorderColor = UIColor.clear.cgColor
            disabledBackgroundColor = BDSColor().brandSecondary
            
            indicatorView.color = .white
            indicatorView.tintColor = .white
            
        case .outline:
            defaultBackgroundColor = .clear
            defaultTintColor = BDSColor().brandSecondary
            defaultBorderColor = BDSColor().brandSecondary.cgColor
            disabledBackgroundColor = .clear
            
            indicatorView.color = BDSColor().backGroundPrimary
            indicatorView.tintColor = BDSColor().backGroundPrimary
            
        case .outlineLight:
            defaultBackgroundColor = .clear
            defaultTintColor = BDSColor().grayScale0
            defaultBorderColor = BDSColor().grayScale0.cgColor
            disabledBackgroundColor = .clear
            
            indicatorView.color = BDSColor().grayScale0
            indicatorView.tintColor = BDSColor().grayScale0
            
        case .secondary:
            defaultBackgroundColor = BDSColor().backGroundPrimary
            defaultTintColor = BDSColor().brandSecondary
            defaultBorderColor = UIColor.clear.cgColor
            disabledBackgroundColor = BDSColor().grayScale0
            disabledTintColor = BDSColor().grayScale20
            disabledBorderColor = BDSColor().grayScale20.cgColor
            
            indicatorView.color = BDSColor().brandSecondary
            indicatorView.tintColor = BDSColor().brandSecondary
        }
        
        updateLayout()
        layoutIfNeeded()
    }
}
