//
//  TMLabelConfig.swift
//  TMComponent
//
//  Created by Jason Zhang on 2023/7/6.
//

import Foundation

open class TMLabelConfig {
    /// 标题
    public var title: String
    /// 字体
    public var font: UIFont
    /// 对齐
    public var textAlignment: NSTextAlignment
    
    public init(title: String, font: UIFont = UIFont.systemFont(ofSize: 17), textAlignment: NSTextAlignment = .left) {
        self.title = title
        self.font = font
        self.textAlignment = textAlignment
    }
}
