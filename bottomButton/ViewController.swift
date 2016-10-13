//
//  ViewController.swift
//  bottomButton
//
//  Created by junaid on 10/2/16.
//  Copyright © 2016 junaid. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var width: NSLayoutConstraint!
    
    let floatingBtn = JumpToTop()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = floatingBtn.self
        self.navigationUI()
        floatingBtn.drawfloatingButton(addToView: self.contentView,andTopView:self.view)
        floatingBtn.floatingButton.addTarget(self, action: #selector(ViewController.buttonTapped), for: .touchUpInside)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonTapped() {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    
    func navigationUI()  {
        self.navigationController?.navigationBar.barTintColor = UIColor.init(colorLiteralRed: 0.19, green: 0.25, blue: 0.62, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white ]
        self.title = "Long Description"
    }
}
