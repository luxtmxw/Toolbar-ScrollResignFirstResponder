//
//  ViewController.swift
//  Toolbar&ScrollResignFirstResponder
//
//  Created by luxtmxw on 16/5/26.
//  Copyright © 2016年 Bintao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var preContentOffSet_y: CGFloat = 0
    
    let kScreenWidth = UIScreen.mainScreen().bounds.size.width
    let kScreenHeight = UIScreen.mainScreen().bounds.size.height
    @IBOutlet weak var textTF: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = view.frame
        scrollView.contentSize = CGSizeMake(kScreenWidth, 2 * kScreenHeight)
        scrollView.delegate = self
        
        let frame = CGRectMake(0, 0, kScreenWidth, 30)
        let addToolBar = AddToolBarForKeyboard(frame: frame, textTF: textTF)
        addToolBar.addToolDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIScrollViewDelegate, AddToolBarForKeyboardDelegate {
    
    func resignKeyboard() {
//       textTF.resignFirstResponder()
        view.endEditing(true)
    }
   
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        preContentOffSet_y = scrollView.contentOffset.y
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > preContentOffSet_y {
            view.endEditing(true)
        }
    }
}
