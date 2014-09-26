//
//  DocumentBuilder.swift
//  TableStretch
//
//  Created by suisho on 2014/09/25.
//  Copyright (c) 2014年 suisho. All rights reserved.
//

import UIKit

class DocumentBuilder: NSObject {
    let attributedString : NSAttributedString
    
    init(strings: [String], font : UIFont){
        
        let buffer = NSMutableAttributedString()
        for str in strings{
            
            let data = str.dataUsingEncoding(NSUTF32StringEncoding, allowLossyConversion: true)
            //let data = NSData(str, options: NSUTF8StringEncoding)
            let attr = [
                NSFontAttributeName: font,
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType
            ]
            let at = NSAttributedString(data: data, options: attr, documentAttributes: nil, error: nil)
            
            //let at = NSAttributedString(string: str + "\n", attributes: attr)
            buffer.appendAttributedString(at)
        }
        attributedString = buffer
    }
    
    func size(width : Int) -> CGRect{
        let size = CGSize(width: CGFloat(width), height: CGFloat.max)
        return attributedString.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
    }
}
