import UIKit

class ColorFormatter: StandardAttributeFormatter {

    init(color: UIColor = .black) {
        super.init(attributeKey: .foregroundColor,
                   attributeValue: color,
                   htmlRepresentationKey: .colorHtmlRepresentation)
    }
    
    override func apply(to attributes: [NSAttributedString.Key: Any], andStore representation: HTMLRepresentation?) -> [NSAttributedString.Key: Any] {
        var resultingAttributes = attributes
        
        resultingAttributes[attributeKey] = attributeValue
        resultingAttributes[htmlRepresentationKey] = representation
        // MARK: FIX BUG: 1000272
        // we should remove foreground color by sub class itself
        resultingAttributes.removeValue(forKey: .foregroundColor)
        return resultingAttributes
    }
    

}
