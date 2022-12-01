//
//  UIColor + Extension.swift
//  BaneseDesignSystem
//
//  Created by Raul Rodrigo on 21/10/22.
//

import UIKit

extension UIColor {
    // Convert a hex string to a UIColor object.
    @objc class func colorFromHex(_ hexString: String) -> UIColor {
        
        func cleanHexString(_ hexString: String) -> String {
            
            var cleanedHexString = String()
            
            // Remove the leading "#"
            if hexString[hexString.startIndex] == "#" {
                let index = hexString.index(hexString.startIndex, offsetBy: 1)
                cleanedHexString = String(hexString[index...])
            }
            
            return cleanedHexString
        }
        
        let cleanedHexString = cleanHexString(hexString)
        
        // If we can get a cached version of the colour, get out early.
        if let cachedColor = UIColor.getColorFromCache(cleanedHexString) {
            return cachedColor
        }
        
        // Else create the color, store it in the cache and return.
        let scanner = Scanner(string: cleanedHexString)
        
        var value: UInt64 = 0
        
        // We have the hex value, grab the red, green, blue and alpha values.
        // Have to pass value by reference, scanner modifies this directly as the result of
        // Scanning the hex string. The return value is the success or fail.
        if scanner.scanHexInt64(&value) {
            
            let intValue = UInt32(value)
            let mask: UInt32 = 0xFF
            
            let red = intValue >> 16 & mask
            let green = intValue >> 8 & mask
            let blue = intValue & mask
            
            // Red, green, blue and alpha are currently between 0 and 255
            // We want to normalise these values between 0 and 1 to use with UIColor.
            let colors: [UInt32] = [red, green, blue]
            let normalised = normaliseColors(colors)
            
            let newColor = UIColor(red: normalised[0], green: normalised[1], blue: normalised[2],
                                   alpha: 1)
            UIColor.storeColorInCache(cleanedHexString, color: newColor)
            
            return newColor
            
        }
        // We couldn't get a value from a valid hex string.
        else {
            print("Error: Couldn't convert the hex string to a number, " +
                  "returning UIColor.whiteColor() instead.")
            return UIColor.white
        }
    }
    
    // Takes an array of colours in the range of 0-255 and returns a value between 0 and 1.
    fileprivate class func normaliseColors(_ colors: [UInt32]) -> [CGFloat] {
        var normalisedVersions = [CGFloat]()
        
        for color in colors {
            normalisedVersions.append(CGFloat(color % 256) / 255)
        }
        
        return normalisedVersions
    }
    
    // Caching
    // Store any colours we've gotten before. Colours don't change.
    fileprivate static var hexColorCache = [String : UIColor]()
    
    fileprivate class func getColorFromCache(_ hexString: String) -> UIColor? {
        guard let color = UIColor.hexColorCache[hexString] else {
            return nil
        }
        
        return color
    }
    
    fileprivate class func storeColorInCache(_ hexString: String, color: UIColor) {
        
        if UIColor.hexColorCache.keys.contains(hexString) {
            return // No work to do if it is already there.
        }
        
        UIColor.hexColorCache[hexString] = color
    }
    
    fileprivate class func clearColorCache() {
        UIColor.hexColorCache.removeAll()
    }
    
}
