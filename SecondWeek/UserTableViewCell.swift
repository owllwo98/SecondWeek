//
//  UserTableViewCell.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    // 타입 저장 프로퍼티
    static let identifier = "UserTableViewCell"

    // 일단은 Outlet 만 연결
    // 만약 Action 을 연결하면 버튼하나 클릭시 전체에 영향 -> Cell 하나를 복붙한거라
    @IBOutlet  var profileImageView: UIImageView!
    @IBOutlet private var  nameLabel: UILabel!
    @IBOutlet  var  messageLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    func configureData(row: Friends) {
        
        print(#function)
//        profileImageView.backgroundColor = .brown
//        nameLabel.font = .boldSystemFont(ofSize: 30)
//        messageLabel.font = .systemFont(ofSize: 20)
        
        nameLabel.text = row.nameDescription
        messageLabel.text = row.message
        
//        messageLabel.text = "상태 메시지"
        
        let image = row.profile_image
        
        if let image {
            let url = URL(string: image)
            profileImageView.kf.setImage(with: url)
        } else {
//            profileImageView.image = UIImage(systemName: "star")
        }
        
    }
    
    // private 을 사용한 접근제어 효율성의 측면에서 어짜피 VC 를 시각적으로 잘 분리해두어도 결국 VC 서로가 호출될 가능성을 갖게되기에 연결고리가 생긴다 즉 이것을 끊어내고 내부적으로만 메서드를 사용하는 것이 private 이다. 이것을 습관을 잘 들이자.
    private func configure() {
        profileImageView.backgroundColor = .brown
        nameLabel.font = .boldSystemFont(ofSize: 30)
        messageLabel.font = .systemFont(ofSize: 20)
        messageLabel.numberOfLines = 0
    }
    
    // 인스턴스 메서드
//    override func awakeFromNib() {
//        
//    }
    
    // 타입 메서드
//    override class func awakeFromNib() {
//
//    }
    

    
    // 다만 StoryBoard 기반으로 만들었을때만 사용가능하다.
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        // 초기 코드 입력
        // 약간이라도 리소스를 아낄 수 있다.
        configure()
    }
    
    // Cell 이 재사용될때 실행 -> Cell 을 한번 청소해주고 다시 쓰는 느낌으로 사용헤보자
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        profileImageView.image = UIImage(systemName: "star")
    }
    

}

