//
//  TextBottom.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import UIKit

@IBDesignable
public class TextBottom: UIButton {
    
    @IBInspectable
    public var colore : UIColor = MaterialDesign.PrimaryColor
    
    func setUp(){
        self.tintColor = colore
    }
    
    public override func prepareForInterfaceBuilder() {
        self.setUp()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
}
