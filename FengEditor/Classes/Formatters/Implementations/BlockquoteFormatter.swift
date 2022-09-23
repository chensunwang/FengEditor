import Foundation
import UIKit


// MARK: - Blockquote Formatter
//
class BlockquoteFormatter: ParagraphAttributeFormatter {

    /// Attributes to be added by default
    ///
    let placeholderAttributes: [NSAttributedString.Key: Any]?


    /// Designated Initializer
    ///
    init(placeholderAttributes: [NSAttributedString.Key: Any]? = nil) {
        self.placeholderAttributes = placeholderAttributes
    }


    // MARK: - Overwriten Methods

    func apply(to attributes: [NSAttributedString.Key: Any], andStore representation: HTMLRepresentation?) -> [NSAttributedString.Key: Any] {
        let newParagraphStyle = ParagraphStyle()
        
        if let paragraphStyle = attributes[.paragraphStyle] as? NSParagraphStyle {
            newParagraphStyle.setParagraphStyle(paragraphStyle)
        }

        newParagraphStyle.appendProperty(Blockquote(with: representation))

        var resultingAttributes = attributes
        // FIXME: make font in center vertically
//        if let currentFont = resultingAttributes[NSAttributedString.Key.font] as? UIFont {
//            let offset = currentFont.lineHeight - (currentFont.pointSize * UIScreen.main.scale)
//            resultingAttributes[.baselineOffset] = offset
//        } else {
        //            resultingAttributes[NSAttributedString.Key.baselineOffset] = -11 // FIXME: TODO: Magic Number
//        }
        resultingAttributes[.paragraphStyle] = newParagraphStyle
        resultingAttributes[.foregroundColor] = UIColor(red: 141.0/255.0, green: 145.0/255.0, blue: 153.0/255.0, alpha: 1) // FIXME: TODO: Magic Number
        return resultingAttributes
    }

    func remove(from attributes:[NSAttributedString.Key: Any]) -> [NSAttributedString.Key: Any] {
        guard let paragraphStyle = attributes[.paragraphStyle] as? ParagraphStyle,
            !paragraphStyle.blockquotes.isEmpty
        else {
            return attributes
        }

        let newParagraphStyle = ParagraphStyle()
        newParagraphStyle.setParagraphStyle(paragraphStyle)        
        newParagraphStyle.removeProperty(ofType: Blockquote.self)

        var resultingAttributes = attributes
        resultingAttributes[.paragraphStyle] = newParagraphStyle
        if newParagraphStyle.headerLevel == 0 {
            resultingAttributes.removeValue(forKey: .foregroundColor)
        }
        return resultingAttributes
    }

    func present(in attributes: [NSAttributedString.Key: Any]) -> Bool {
        guard let style = attributes[.paragraphStyle] as? ParagraphStyle else {
            return false
        }
        return !style.blockquotes.isEmpty
    }
}


class FontColorFormatter: AttributeFormatter {
    var placeholderAttributes: [NSAttributedString.Key: Any]? { return nil }
    
    let htmlRepresentationKey: NSAttributedString.Key
    var color: UIColor = UIColor.blue
    
    init(color: UIColor, htmlRepresentationKey: NSAttributedString.Key) {
        self.htmlRepresentationKey = htmlRepresentationKey
        self.color = color
    }
    
    func applicationRange(for range: NSRange, in text: NSAttributedString) -> NSRange {
        return range
    }
    
    func worksInEmptyRange() -> Bool {
        return false
    }
    
    func apply(to attributes: [NSAttributedString.Key: Any], andStore representation: HTMLRepresentation?) -> [NSAttributedString.Key: Any] {
        
        guard let _ = attributes[.foregroundColor] as? UIColor else {
            return attributes
        }
        
//        let newFont = font.modifyTraits(traits, enable: true)
        
        var resultingAttributes = attributes
        
        resultingAttributes[.foregroundColor] = self.color
        resultingAttributes[htmlRepresentationKey] = representation
        
        return resultingAttributes
    }
    
    func remove(from attributes: [NSAttributedString.Key: Any]) -> [NSAttributedString.Key: Any] {
        var resultingAttributes = attributes
        guard let _ = attributes[.foregroundColor] as? UIFont else {
            return attributes
        }
        
//        let newFont = font.modifyTraits(traits, enable: false)
        resultingAttributes[.foregroundColor] = self.color
        
        resultingAttributes.removeValue(forKey: htmlRepresentationKey)
        
        return resultingAttributes
    }
    
    func present(in attributes: [NSAttributedString.Key : Any]) -> Bool {
        guard let _ = attributes[.foregroundColor] as? UIColor else {
            return false
        }
        return true
//        let enabled = font.containsTraits(traits)
//        return enabled
    }
    
    
}
