//
//  DynamicLabel.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 21/10/22.
//

import Foundation

import UIKit

public enum LabelStyle {
    case darkBody1_14
    case darkTitle1_24
}

public class BDSDynamicLabel: BDSUILabel {
    
    //MARK: - Setup
    public func setup(style: LabelStyle, text: String?, textAlignment: NSTextAlignment?) {
        self.text = text
        
        switch style {
        case .darkBody1_14:
            setProperties(font: .body1, textColor: BDSColor().grayScale20, textAlignment: textAlignment)
        case .darkTitle1_24:
            setProperties(font: .title1, textColor: BDSColor().grayScale20, textAlignment: textAlignment)
        }
    }
}
