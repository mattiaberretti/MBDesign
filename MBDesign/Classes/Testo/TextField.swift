//
//  TextField.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import UIKit

@objc
public enum buttomSide : Int{
    case right = 0
    case left = 1
}

@objc
public protocol TextField {
    func resignFirstResponder() -> Bool
    func becomeFirstResponder() -> Bool
    
    var scrollItem : ScrollableItem? { get set }
    var frame : CGRect { get set }
    
    func addBottom(side : buttomSide, bottone : UIBarButtonItem)
}

extension BaseTextField {
    public func addBottom(side: buttomSide, bottone: UIBarButtonItem) {
        if let bar = self.inputAccessoryView as? UINavigationBar, let item = bar.items?.first {
            if side == .right {
                var elenco = item.rightBarButtonItems ?? []
                elenco.append(bottone)
                item.rightBarButtonItems = elenco
            }
            else{
                var elenco = item.leftBarButtonItems ?? []
                elenco.append(bottone)
                item.leftBarButtonItems = elenco
            }
        }
    }
}

extension BaseTextView {
    public func addBottom(side: buttomSide, bottone: UIBarButtonItem) {
        if let bar = self.inputAccessoryView as? UINavigationBar, let item = bar.items?.first {
            if side == .right {
                var elenco = item.rightBarButtonItems ?? []
                elenco.append(bottone)
                item.rightBarButtonItems = elenco
            }
            else{
                var elenco = item.leftBarButtonItems ?? []
                elenco.append(bottone)
                item.leftBarButtonItems = elenco
            }
        }
    }
}

