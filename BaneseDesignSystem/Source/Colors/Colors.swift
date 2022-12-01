//
//  Colors.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 21/10/22.
//

import UIKit

class BDSColor {
    let theme =  BDSSetup.sharedInstance.theme
    
    var brandPrimary: UIColor {
        return UIColor.colorFromHex(theme!.brandPrimary)
    }
    
    var brandSecondary: UIColor {
        return UIColor.colorFromHex(theme!.brandScondary)
    }
    
    var colorBrandTertiary: UIColor {
        return UIColor.colorFromHex(theme!.colorBrandTertiary)
    }
    
    var colorError: UIColor {
        return UIColor.colorFromHex(theme!.errorColor)
    }
    
    var colorAlert: UIColor {
        return UIColor.colorFromHex(theme!.alertColor)
    }
    
    var colorSuccess: UIColor {
        return UIColor.colorFromHex(theme!.successColor)
    }
    
    var backGroundPrimary: UIColor {
        return UIColor.colorFromHex(theme!.backgroundPrimary)
    }
    
    var auxiliary01: UIColor {
        return UIColor.colorFromHex(theme!.auxiliar01)
    }
    
    var grayScaleDark: UIColor {
        return UIColor.colorFromHex(theme!.grayScaleDark)
    }
    
    var grayScale90: UIColor {
        return UIColor.colorFromHex(theme!.grayScale90)
    }
    
    var grayScale80: UIColor {
        return UIColor.colorFromHex(theme!.grayScale80)
    }
    
    var grayScale20: UIColor {
        return UIColor.colorFromHex(theme!.grayScale20)
    }
    
    var grayScale10: UIColor {
        return UIColor.colorFromHex(theme!.grayScale10)
    }
    
    var grayScale5: UIColor {
        return UIColor.colorFromHex(theme!.grayScale5)
    }
    
    var grayScale0: UIColor {
        return UIColor.colorFromHex(theme!.grayScale0)
    }
    
    
    internal class func makeGradient(_ colors: [UIColor], frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        var cgColors = [CGColor]()
        
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        gradientLayer.colors = cgColors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = frame
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        return gradientLayer
    }
}
