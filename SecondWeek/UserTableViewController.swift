//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/3/25.
//

import UIKit
import Kingfisher


struct Friend {
    
    let name: String
    let message: String
    let profile_image: String
    
}


class UserTableViewController: UITableViewController {
    
//    let friends = [
//        Friend(name: "고래밥", message: "고래밥 냠냠", profile_image: "star"),
//        Friend(name: "칙촉", message: "행복한 하루", profile_image: "pencil"),
//        Friend(name: "카스타드", message: "배고파", profile_image: "star.fill")
//    ]
//    
//    let name = ["고래밥", "칙촉", "카스타드"]
//    let message = ["고래밥 냠냠", "행복한 하루", "배고파"]
//    let profile = ["star", "pencil", "star.fill"]
    
    let friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // UserTableViewCell 과 연결?
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        // 많이 쓰니까
        let row = friends[indexPath.row]
        
        let image = row.profile_image
        let like = row.like ? "heart.fill" : "heart"
        
        // profile_image 값이 nil 인 경우도 있으니까
        if let image {
            let url = URL(string: image)
            cell.profileImageView.kf.setImage(with: url)
        } else {
            cell.profileImageView.image = UIImage(systemName: "star")
        }
//        
//        if like == true {
//            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        } else {
//            cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//        }
        cell.likeButton.setImage(UIImage(systemName: like), for: .normal)
        
        
        cell.profileImageView.backgroundColor = .brown
        cell.nameLabel.text = row.name
        cell.messageLabel.text = row.message
//        cell.profileImageView.image = UIImage(systemName: friends.list[indexPath.row].profile_image)
//        cell.profileImageView.kf.setImage(with: URL(string: image))
        cell.messageLabel.text = "상태 메시지"
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 30)
        cell.messageLabel.font = .systemFont(ofSize: 20)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
