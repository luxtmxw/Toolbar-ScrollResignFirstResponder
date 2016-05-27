//
//  AddToolBarForKeyboard.swift
//  Toolbar&ScrollResignFirstResponder
//
//  Created by luxtmxw on 16/5/27.
//  Copyright © 2016年 Bintao. All rights reserved.
//

import UIKit

protocol AddToolBarForKeyboardDelegate: class {
    func resignKeyboard()
}

class AddToolBarForKeyboard: UIToolbar {

    weak var addToolDelegate: AddToolBarForKeyboardDelegate?
    
    convenience init(frame: CGRect, textTF: UITextField) {
        self.init()
        self.frame = frame
        self.barStyle = UIBarStyle.Default
        let btn = UIButton(frame: CGRectMake(345, 0, 30, 30))
        btn.setTitle("完成", forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(14)
        btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btn.addTarget(self, action:#selector(self.action) , forControlEvents: UIControlEvents.TouchUpInside)
        let doneBtn = UIBarButtonItem(customView: btn)
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target:nil, action: nil)
        var toorItems:[UIBarButtonItem]?
        toorItems = [UIBarButtonItem](arrayLiteral:spaceBtn, doneBtn)
        self.items = toorItems
        textTF.inputAccessoryView = self
    }
    
    @objc private func action() {
        self.addToolDelegate?.resignKeyboard()
    }
}
