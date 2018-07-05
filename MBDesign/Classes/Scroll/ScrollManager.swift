//
//  ScrollManager.swift
//  Design
//
//  Created by Mattia on 03/07/18.
//  Copyright © 2018 Mattia. All rights reserved.
//

import UIKit

class ScrollManager: NSObject {
    var campo : TextField
    var container : ScrollableItem
    init(testo : TextField, container : ScrollableItem) {
        self.campo = testo
        self.container = container
    }
    
    var altezzaContainer : CGFloat {
        return self.container.frame.height
    }
    
    func scroll(altezzaTastiera : CGFloat){
        let yElemento = self.altezzaContainer - self.campo.frame.maxY - altezzaTastiera
        if (yElemento) <= 0 {
            let spostamento = yElemento * -1 + 20
            self.container.scrollTo(Posizione: spostamento)
        }
    }
    
    func destroy(){
        self.container.scrollTo(Posizione: 0)
    }
}
