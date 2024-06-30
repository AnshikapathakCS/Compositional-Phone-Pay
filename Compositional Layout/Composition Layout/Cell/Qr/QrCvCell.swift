//
//  QrCvCell.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import UIKit

class QrCvCell: UICollectionViewCell {

    @IBOutlet var parentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.parentView.layer.borderColor = UIColor.black.cgColor
//        self.parentView.layer.borderWidth = 1
        self.parentView.layer.cornerRadius = 12
        // Initialization code
    }

}
