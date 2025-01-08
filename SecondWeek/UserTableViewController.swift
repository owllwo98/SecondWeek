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
    
    var friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "타이틀"
        let star = UIImage(systemName: "star")

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: star, style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        
        
        // 어떤 XIB Cell 을 사용할지 등록해줘야 한다.
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
        
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print(#function, sender.tag)
        
        friends[sender.tag].like.toggle()
        
        print(friends[sender.tag])
        
//        tableView.reloadData()
        
        // row 하나만 reload -> 과제8 광고 View 할때 좋았겠다.
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc
    func rightBarButtonItemTapped() {
        print(#function)
        let sb = UIStoryboard(name: "User", bundle: nil)
      
        // 만약 같은 StoryBoard 내에서 전환이 일어나면 이렇게 사용할수도 있다.
        self.storyboard?.instantiateViewController(withIdentifier: "GrayViewController")
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "GrayViewController") as! GrayViewController
       
        // 오른쪽에서 왼쪽으로
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UserTable 의 인스턴스
//        let cell = UserTableViewCell()
        
        // UserTableViewCell 과 연결?
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        
        // 많이 쓰니까
        let row = friends[indexPath.row]
        
//        let image = row.profile_image
        let like = row.like ? "heart.fill" : "heart"
        
        // profile_image 값이 nil 인 경우도 있으니까
//        if let image {
//            let url = URL(string: image)
//            cell.profileImageView.kf.setImage(with: url)
//        } else {
//            cell.profileImageView.image = UIImage(systemName: "star")
//        }

        
//        if like == true {
//            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        } else {
//            cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//        }
        
        cell.likeButton.setImage(UIImage(systemName: like), for: .normal)
        
        // 버튼을 구분하기 위해 tag 입력
        cell.likeButton.tag = indexPath.row
        
        // IBAction 없이 연결 방법
        // Function Types
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
//        
//    
//        //
        cell.configureData(row: row)
//        cell.profileImageView.image = UIImage(systemName: friends.list[indexPath.row].profile_image)
//        cell.profileImageView.kf.setImage(with: URL(string: image))
//        cell.messageLabel.text = "상태 메시지"
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        // 1. 스토리보드 특정
        let sb = UIStoryboard(name: "User", bundle: nil)
        // 2. 전환할 뷰컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        
        // 값 전달 시 아웃렉 활용을 할 수 없음
        // 해당 코드가 실행되는 시점보다 아웃렛이 나중에 만들어진다
//        vc.testLabel.text = "고래밥"
        
        // 2. Pass Data - vc 가 갖고 있는 프로퍼티에 데이터 추가
        vc.contents = friends[indexPath.row].name
         
        // (옵션1)
        vc.modalPresentationStyle = .fullScreen // 아래에서 위로 뜰 때 방식
        vc.modalTransitionStyle = .crossDissolve // 전환 애니메이션
        
        //(옵션2) present 이지만 navi title 도 쓰고 싶다면, 다시 네비게이션 컨트롤러를 임베드 해서, 네비게이션 컨트롤러를 present
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen // 아래에서 위로 뜰 때 방식
        navi.modalTransitionStyle = .crossDissolve
        
        
        // 3. 화면을 전환할 방법 선택하기 - 아래에서 위로 / modal / present
        // 아래에서 위로
        present(navi, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
        
//      tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
