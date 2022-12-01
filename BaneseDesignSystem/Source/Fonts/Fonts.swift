//
//  Fonts.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 20/10/22.
//

import Foundation
import UIKit
extension UIFont {
    
    private enum Constants {
        static let sizeBig: CGFloat = 48.0
        static let sizeMedium: CGFloat = 32.0
        static let sizeTitle1: CGFloat = 24.0
        static let sizeButtonTitle: CGFloat = 20.0
        static let sizeTitle2: CGFloat = 18.0
        static let sizeSubtitle: CGFloat = 16.0
        static let sizeBody1: CGFloat = 14.0
        
        static let fontFamily: String = BDSConfiguration.getFontName()
        static let fontBold: String = "-Bold"
        static let fontSemiBold: String = "-SemiBold"
        static let fontMedium: String = "-Medium"
        static let fontRegular: String = "-Regular"
        static let fontLight: String = "-Light"
    }
    
    //MARK: Bold
    
    internal class var bigSize: UIFont {
        return UIFont(name: Constants.fontFamily + Constants.fontBold, size: Constants.sizeBig) ?? UIFont.preferredFont(forTextStyle: .headline)
    }
    
    internal class var mediumSize: UIFont {
        return UIFont(name: Constants.fontFamily + Constants.fontBold, size: Constants.sizeMedium) ?? UIFont.preferredFont(forTextStyle: .headline)
    }
    
    internal class var title1: UIFont {
        return UIFont(name: Constants.fontFamily + Constants.fontBold, size: Constants.sizeTitle1) ?? UIFont.preferredFont(forTextStyle: .headline)
    }
    
    internal class var title2: UIFont {
        return UIFont(name: Constants.fontFamily + Constants.fontBold, size: Constants.sizeTitle2) ?? UIFont.preferredFont(forTextStyle: .headline)
    }
    
    internal class var subtitle: UIFont {
        return UIFont(name: Constants.fontFamily + Constants.fontBold, size: Constants.sizeSubtitle) ?? UIFont.preferredFont(forTextStyle: .headline)
    }
    
    internal class var body1: UIFont {
        return UIFont(name: Constants.fontFamily + Constants.fontMedium, size: Constants.sizeBody1) ?? UIFont.preferredFont(forTextStyle: .headline)
    }
    
    internal class var buttonTitle: UIFont {
        return UIFont(name: Constants.fontFamily + Constants.fontMedium, size: Constants.sizeButtonTitle) ?? UIFont.preferredFont(forTextStyle: .headline)
    }
}
