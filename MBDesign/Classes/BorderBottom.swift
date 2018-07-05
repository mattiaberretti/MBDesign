//
//  BorderBottom.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import UIKit

@IBDesignable
public class BorderBottom: TextBottom {

    @IBInspectable
    public var fillColor : UIColor = MaterialDesign.PrimaryColor
    @IBInspectable
    public var borderWidth : CGFloat = 2
    @IBInspectable
    public var padding : CGFloat = 10
    @IBInspectable
    public var borderRadius : CGFloat = 10
    
    override func setUp(){
        super.setUp()
        self.layer.borderColor = fillColor.cgColor
        self.layer.borderWidth = borderWidth
        self.contentEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        self.layer.cornerRadius = self.borderRadius
    }

}
