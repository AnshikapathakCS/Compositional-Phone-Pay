//
//  HeaderView.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import UIKit

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureTitle(title: String) {
        titleLabel.text = title
    }

}
