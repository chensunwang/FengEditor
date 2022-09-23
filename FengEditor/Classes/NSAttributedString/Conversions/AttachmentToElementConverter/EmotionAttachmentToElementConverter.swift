//
//  EmotionAttachmentToElementConverter.swift
//  Aztec
//
//  Created by  weiphone on 2018/9/28.
//  Copyright © 2018 Automattic Inc. All rights reserved.
//

import UIKit

class EmotionAttachmentToElementConverter: AttachmentToElementConverter {
//    typealias Attachment = EmotionAttachment
    
    func convert(_ attachment: EmotionAttachment, attributes: [NSAttributedString.Key : Any]) -> [Node] {
        let emotionNode = ElementNode(type: .img)
        if let attribute = emotionAttribute(from: attachment) {
            emotionNode.updateAttribute(named: attribute.name, value: attribute.value)            
        }
        
        return [emotionNode]
    }
    
    private func emotionAttribute(from attachment: EmotionAttachment) -> Attribute? {
        guard let source = attachment.emotionKey else {
            return nil
        }
        
        return Attribute(type: .src, value: .string(source))
    }

}
