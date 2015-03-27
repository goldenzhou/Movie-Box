//
//  TextTableViewCell.swift
//  Smashtag
//
//  Created by Liuyu Zhou on 2/14/15.
//  Copyright (c) 2015 Stanford University. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TextViewLabel: UILabel!

    
    var Text: String? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        TextViewLabel.text = nil
        if let words = self.Text {
            TextViewLabel.text = words
        }

    }

    
}
