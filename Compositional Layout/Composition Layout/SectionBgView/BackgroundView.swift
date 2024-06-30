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
       // vw.layer.borderColor = UIColor.black.cgColor
        //vw.layer.borderWidth = 1
        vw.clipsToBounds = true
        return vw
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        // Convert hex string to integer
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        // Create UIColor from hexadecimal value
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
