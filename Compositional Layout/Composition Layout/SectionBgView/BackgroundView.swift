//
//  BackgroundView.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import UIKit

class BackgroundView: UICollectionReusableView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    var contentView: UIView = {
        let vw = UIView.init(frame: CGRect.zero)
        vw.backgroundColor =  UIColor(hex: "EEE7F3")
        vw.layer.cornerRadius = 12
        vw.clipsToBounds = true
        return vw
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
