//
//  Setup.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 20/10/22.
//

import Foundation

class BDSSetup {
    var theme: Theme!
    
    static var sharedInstance = BDSSetup()
    
    func setup(theme: Theme) {
        self.theme = theme
    }
    
}
