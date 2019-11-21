//
//  RoundedCellView.swift
//  Pill Reminder
//
//  Created by Chad Rutherford on 11/21/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCellView: UIView {
    
    /// Creates a custom view for the table view cell
    override func layoutSubviews() {
        clipsToBounds = true
        layer.cornerRadius = 15
        backgroundColor = UIColor(red: 220 / 255, green: 250 / 255, blue: 255 / 255, alpha: 1)
    }
}
