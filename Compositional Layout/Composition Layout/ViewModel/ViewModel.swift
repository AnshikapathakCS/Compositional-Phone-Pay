//
//  ViewModel.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import Foundation

protocol CollectionViewProtocol {
    var numberOfSections : Int { get }
    func numberOfItems(in section: Int) -> Int
    func titleForSection(_ section: Int) -> String?
    func imageNameForSection(_ section: Int, at index: Int) -> String?
}

protocol CollectionViewDelegate: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}

class ViewModel: CollectionViewProtocol {
    let dataSourceTitle = ["Transfer Money", "Recharge and Paybills", "Sponsored Links", "Insurance", "Travel Bookings", "Switch"]
    
    let dataSource = ["HeaderImgTwo", "HeaderImgThree" , "HeaderImgSix", "HeaderImgOne", "HeaderImgFive", "HeaderImgFour"]
    
    let dataSSourceTripImages = ["flyjet", "vistara", "trip", "yatra", "Esemytrip", "ixigo", "makemytrip","ixigo" ]
    
    let rechargeArray = ["jio", "bsnl", "jio", "bsnl"]
    
    var numberOfSections: Int {
        return 8
    }
    
    func numberOfItems(in section: Int) -> Int {
        switch section {
        case 0, 5:
            return 5
        case 1, 6, 7, 8, 9:
            return 4
        case 2:
            return 1
        case 3:
            return 3
        default:
            return 8
        }
    }
    
    func titleForSection(_ section: Int) -> String? {
        guard section < dataSourceTitle.count else { return nil }
        return dataSourceTitle[section]    }
    
    func imageNameForSection(_ section: Int, at index: Int) -> String? {
        switch section {
        case 0, 5:
            return dataSource[index]
        case 1:
            return rechargeArray[index]
        case 4, 6, 7, 8, 9:
            return dataSSourceTripImages[index]
        default:
            return nil
        }
    }
    
    
    
    
}
