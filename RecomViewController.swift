//
//  RecomViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/8/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class RecomViewController: UIViewController {


    @IBOutlet weak var statsView: UITextView! {
        didSet {
            statsView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
            statsView?.text = text
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if statsView != nil && presentingViewController != nil {
                return statsView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
    }

}
