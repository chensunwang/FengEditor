import Foundation
import UIKit

class BoldElementAttributesConverter: ElementAttributeConverter {    

    let cssAttributeMatcher = BoldCSSAttributeMatcher()
    
    func convert(
        _ attribute: Attribute,
        inheriting attributes: [NSAttributedString.Key: Any]) -> [NSAttributedString.Key: Any] {
        
        guard attribute.containsCSSAttribute(matching: cssAttributeMatcher) else {
            return attributes
        }
        
        var attributes = attributes
        
        // The default font should already be in the attributes.  But in case it's nil
        // we should have some way to figure out the default font.  Honestly it feels like
        // this configuration should come from elsewhere, but we'll just default to the
        // default system font of size 14 for now.
        //
        let font = attributes[.font] as? UIFont ?? UIFont.systemFont(ofSize: 16)
        let newFont = font.modifyTraits([.traitBold], enable: true)
        
        attributes[.font] = newFont
        
        return attributes
    }
}
