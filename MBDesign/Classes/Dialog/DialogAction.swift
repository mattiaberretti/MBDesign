//
//  DialogAction.swift
//  Design
//
//  Created by Mattia on 30/06/18.
//  Copyright © 2018 Mattia. All rights reserved.
//

import UIKit

public typealias DialogActionCallBack = (_ action : DialogAction) -> Void

public class DialogAction: NSObject {
    var action : DialogActionCallBack?
    var titolo : String!
    
    public init(titolo : String, action : DialogActionCallBack?){
        self.titolo = titolo
        self.action = action
    }
}
