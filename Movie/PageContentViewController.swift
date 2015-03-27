//
//  PageContentViewController.swift
//  Movie
//
//  Created by Liuyu Zhou on 3/5/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {


    @IBOutlet weak var pgImageView: UIImageView!
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet {
            if let imageView = pgImageView {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pgImageView.image = UIImage(named: imageName)
    }

   
}
