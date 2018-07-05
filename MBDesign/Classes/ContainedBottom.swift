//
//  ContainedBottom.swift
//  MaterialDesign
//
//  Created by Mattia on 29/05/18.
//

import UIKit

@IBDesignable
public class ContainedBottom: BorderBottom {

    override func setUp() {
        super.setUp()
        self.tintColor = UIColor.white
        self.backgroundColor = self.fillColor
    }

}
