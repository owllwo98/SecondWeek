//
//  TenCollectionViewCell.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/7/25.
//

import UIKit

class TenCollectionViewCell: UICollectionViewCell {

    @IBOutlet var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if posterImageView.clipsToBounds {
            
        }
        
        posterImageView.backgroundColor = .brown
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }

}
