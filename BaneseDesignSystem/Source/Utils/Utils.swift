//
//  Utils.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 21/10/22.
//

import Foundation
import UIKit

struct ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLenght = max(ScreenSize.width, ScreenSize.height)
    static let minLenght = min(ScreenSize.width, ScreenSize.height)
    static let isLarge: Bool = ScreenSize.width > 320
}

enum BDSDimensions {
    
    /// External space of the view
    enum Margins {
        /// CGFloat 0.0
        static let zeroMargin: CGFloat = 0
        /// CGFloat 4.0
        static let smallestMargin: CGFloat = 4
        /// CGFloat 8.0
        static let smallMargin: CGFloat = 8
        /// CGFloat 12.0
        static let mediumMargin: CGFloat = 12
        /// CGFloat 16.0
        static let defaultMargin: CGFloat = 16
        /// CGFloat 20.0
        static let bigMargin20: CGFloat = 20
        /// CGFloat 24.0
        static let bigMargin: CGFloat = 24
        /// CGFloat 36.0
        static let biggestMargin: CGFloat = 36
        /// CGFloat 48.0
        static let biggestMargin48: CGFloat = 48
    }
    
    enum CornerRadius {
        /// CGFloat 8.0
        static let small: CGFloat = 8
        /// CGFloat 16.0
        static let `default`: CGFloat = 16
        /// CGFloat 24.0
        static let big: CGFloat = 24
    }
    
    /// Icons dimens
    enum Icon {
        /// CGFloat 12.0
        static let small: CGFloat = 12
        /// CGFloat 16.0
        static let medium: CGFloat = 16
        /// CGFloat 24.0
        static let defaultSize: CGFloat = 24
        /// CGFloat 32
        static let big32: CGFloat = 32
        /// CGFloat 40
        static let big40: CGFloat = 40
        /// CGFloat 48
        static let big: CGFloat = 48
    }
}
