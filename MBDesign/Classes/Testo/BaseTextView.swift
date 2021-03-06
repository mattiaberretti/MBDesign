//
//  BaseTextView.swift
//  Design
//
//  Created by Mattia on 30/06/18.
//  Copyright © 2018 Mattia. All rights reserved.
//

import UIKit

@IBDesignable
public class BaseTextView: UITextView, TextField {

    @IBOutlet
    public var nextField : TextField?
    @IBOutlet
    public var previusField : TextField?
    @IBInspectable
    public var showDone : Bool = true
    @IBInspectable
    public var titolo : String?
    @IBOutlet
    public var scrollItem: ScrollableItem?

    @IBInspectable
    public var borderColor : UIColor? = UIColor.lightGray
    
    @IBInspectable
    public var borderWidth : CGFloat = 2
    @IBInspectable
    public var borderRadius : CGFloat = 5
    
    private var scrollManager : ScrollManager!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        if self.mostraBarra {
            let dimensioni = UIScreen.main.bounds
            let barra = UINavigationBar(frame: CGRect(x: 0, y: -44, width: dimensioni.size.width, height: 44))
            barra.items = [self.barra]
            self.inputAccessoryView = barra
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: OperationQueue.main) { (notifica) in
            guard let manager = self.scrollManager else { return }
            
            guard let frame = notifica.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            
            manager.scroll(altezzaTastiera: frame.size.height)
        }
    }
    
    func setUp(){
        self.layer.borderColor = (self.borderColor ?? UIColor.lightGray).cgColor
        self.layer.borderWidth = self.borderWidth
        self.layer.cornerRadius = self.borderRadius
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setUp()
    }
    
    public override func prepareForInterfaceBuilder() {
        self.setUp()
    }
    
    private var mostraBarra : Bool {
        return showDone || nextField != nil || previusField != nil
    }
    
    private lazy var doneBtn: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneBtn(_:)))
    }()
    
    private lazy var backBtn: UIBarButtonItem = {
        let ritorno = UIBarButtonItem(title: "<", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.backBtn(_:)))
        if self.previusField == nil {
            ritorno.isEnabled = false
        }
        return ritorno
    }()
    
    private lazy var nextBtn: UIBarButtonItem = {
        let ritorno = UIBarButtonItem(title: ">", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.nextBtn(_:)))
        if self.nextField == nil {
            ritorno.isEnabled = false
        }
        return ritorno
    }()
    
    lazy var barra: UINavigationItem = {
        let item = UINavigationItem(title: self.titolo ?? "")
        item.rightBarButtonItem = self.doneBtn
        item.leftBarButtonItems = [self.backBtn, self.nextBtn]
        return item
    }()
    
    @objc
    private func nextBtn(_ sender : UIBarButtonItem){
        guard let prossimo = self.nextField else {
            return
        }
        let _ = prossimo.becomeFirstResponder()
    }
    
    @objc
    private func backBtn(_ sender : UIBarButtonItem){
        guard let precedente = self.previusField else {
            return
        }
        let _ = precedente.becomeFirstResponder()
    }
    
    @objc
    private func doneBtn(_ sender : UIBarButtonItem){
        let _ = self.resignFirstResponder()
    }
    
    
    override public func resignFirstResponder() -> Bool {
        self.scrollManager?.destroy()
        self.scrollManager = nil
        return super.resignFirstResponder()
    }
    
    override public func becomeFirstResponder() -> Bool {
        if let item = self.scrollItem {
            self.scrollManager = ScrollManager(testo: self, container: item)
        }
        return super.becomeFirstResponder()
    }
}
