//
//  BannerCvCell.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import UIKit

class BannerCvCell: UICollectionViewCell {
    @IBOutlet var parentView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.parentView.layer.cornerRadius = 12
        // Initialization code
    }

    func configureData(data: String){
        parentView.image = UIImage(named: data)
    }
}
