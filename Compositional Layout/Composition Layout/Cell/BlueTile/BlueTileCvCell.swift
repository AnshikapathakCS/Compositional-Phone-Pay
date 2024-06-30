//
//  BlueTileCvCell.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import UIKit

class BlueTileCvCell: UICollectionViewCell {
    @IBOutlet var parentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.parentView.layer.cornerRadius = 12
        // Initialization code
    }

}
  
