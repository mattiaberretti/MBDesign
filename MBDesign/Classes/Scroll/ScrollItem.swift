//
//  ScrollItem.swift
//  Design
//
//  Created by Mattia on 03/07/18.
//  Copyright © 2018 Mattia. All rights reserved.
//

import UIKit

@objc
public protocol ScrollableItem {
    func scrollTo(Posizione : CGFloat)
    var frame : CGRect { get set }
}

extension ScrollableItem {
}

extension UIScrollView {
    public override func scrollTo(Posizione: CGFloat) {
        self.setContentOffset(CGPoint(x: 0, y: Posizione), animated: true)
    }
}

extension UIView : ScrollableItem {
    public func scrollTo(Posizione: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(translationX: 0, y: -Posizione)
        }
    }
}
