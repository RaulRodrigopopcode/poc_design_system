//
//  Configurations.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 20/10/22.
//

import UIKit
class BDSConfiguration{
    class func getFontName() -> String {
        
        guard let url = Bundle.main.url(forResource: "Info", withExtension:"plist") else {
            return ""
        }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode(BDSFontModel.self, from: data)
            let fontName = result.fonts?["fontName"]
            return fontName ?? ""
        } catch {
            return ""
        }
    }
}
