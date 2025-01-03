//
//  UserTableViewCell.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/3/25.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    // 일단은 Outlet 만 연결
    // 만약 Action 을 연결하면 버튼하나 클릭시 전체에 영향 -> Cell 하나를 복붙한거라
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    

}
