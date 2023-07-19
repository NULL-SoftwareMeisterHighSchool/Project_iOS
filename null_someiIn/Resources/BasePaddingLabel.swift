//
//  BasePaddingLabel.swift
//  null_someiIn
//
//  Created by 김주은 on 2023/07/15.
//

import UIKit

class BasePaddingLabel: UILabel {
    
    private var padding = UIEdgeInsets(top: 2.0, left: 12.0, bottom: 2.0, right: 12.0)
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    //안의 내재되어있는 콘텐트의 사이즈에 따라 height와 width에 padding값을 더해줌
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
    }
}
