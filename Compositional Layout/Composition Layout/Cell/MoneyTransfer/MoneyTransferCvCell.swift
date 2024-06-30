//
//  MoneyTransferCvCell.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import UIKit

class MoneyTransferCvCell: UICollectionViewCell {
    @IBOutlet var iconIv: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.iconIv.layer.cornerRadius = 4
        // Initialization code
    }

    func configure(image: String){
        iconIv.image = UIImage(named: image)
    }
}
