//
//  UIFont+Extension.swift
//  Diary
//
//  Created by 최동호 on 2023/01/30.
//

import UIKit.UIFont

extension UIFont {
    static let titleBoldFont: UIFont = {
        return UIFont.systemFont(ofSize: 30, weight: .bold)
    }()
    
    static let titleFont: UIFont = {
        return UIFont.systemFont(ofSize: 30, weight: .light)
    }()
    
    static let contentFont: UIFont = {
        return UIFont.systemFont(ofSize: 20, weight: .light)
    }()
}
