//
//  MaterialTextField.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import UIKit

@IBDesignable
public class MaterialTextField: BaseTextField {

    @IBInspectable
    public var DisableColore : UIColor = UIColor.lightGray
    @IBInspectable
    public var EnableColor : UIColor = UIColor.blue
    @IBInspectable
    public var UnderlineSize : CGFloat = 2
    
    
    func setUp(){
        self.borderStyle = .none
        self.layer.shadowColor = DisableColore.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 0
        self.layer.masksToBounds = false
        self.layer.backgroundColor = UIColor.white.cgColor
    }
    
    public override func becomeFirstResponder() -> Bool {
        self.layer.shadowColor = EnableColor.cgColor
        return super.becomeFirstResponder()
    }
    
    public override func resignFirstResponder() -> Bool {
        self.layer.shadowColor = DisableColore.cgColor
        return super.resignFirstResponder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUp()
    }

}
