//
//  BasicTableViewController.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {

    var list = ["프로젝트", "쇼핑", "메인 업무", "새싹과제"] {
        // 프로퍼티가 달라질때마다 실행
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var monster = Monster() // 인스턴스를 만들었다. ->  초기화를 하였다.
        
        
        
        
        // 모든 3. 셀의 높이 : heightForRowAt 가 동일할 때 한번에 설정 방법
        tableView.rowHeight = 80
        
                
    }
    
    @IBAction func randomTextTapped(_ sender: UIBarButtonItem) {
        let random = ["장보기", "영화보기", "쇼핑하기", "맛집탐방", "새싹과제", "산책하기"]
        
        list.append(random.randomElement()!)
        
        // View 와 Data 는 따로 놀아서, 늘 잘 맞춰주어야 한다.
        // SwiftUi 에서는 State 를 사용해서 만약 Data 가 변한다면 View 를 새로 그려주지만 UIKit 은 그렇지 않다.
        tableView.reloadData()
        
//        super.loadView()

    }
    
    

    // 1. 셀의 객수 : numberOfRowsInSection ***
    // 테이블뷰가 몇개의 셀로 구성되어 있는지 우리에게 알려주는 역할이 아니라 몇개의 셀을 생성해야 할지 ios 시스템에게 알려주기 위해 작성
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    // 2. 셀 디자인 및 데이터 처리 : cellForRowAt ***
    // 씬에 표현해야 할 셀의 수만큼 반복적으로 호출 like LazyVstack
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 빈 cell 하나 갖고와서
        let cell = tableView.dequeueReusableCell(withIdentifier: "jackCell")!
        
        // 디자인
        cell.textLabel?.text = "텍스트 레이블"
        
        // 셀별로 차이를 줄 수 있지만 불편하다 개선 필요 *
//        if indexPath.row == 0 {
//            cell.textLabel?.text = list[indexPath.row]
//        } else if indexPath.row == 1 {
//            cell.textLabel?.text = list[indexPath.row]
//        } else if indexPath.row == 2 {
//            cell.textLabel?.text = list[indexPath.row]
//        } else {
//            cell.textLabel?.text = "오류"
//        }
        
        // 개선 버전 ***
        /* 왜 반복문을 안써도 됨? -> 어짜피 셀을 만들때마다 매번 해당 함수가 호출되기 때문에 필요없다.
         tableView(_:cellForRowAt:) [0, 0]
         tableView(_:cellForRowAt:) [0, 1]
         tableView(_:cellForRowAt:) [0, 2]
         */
        cell.textLabel?.text = list[indexPath.row]
        
//        cell.detailTextLabel?.text = "디테일 텍스트 레이블"
        cell.detailTextLabel?.setPrimaryLabel(text: "test")
        
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "jackCell")! 의
        // Cell 재사용 매커니즘 때문에
        // else 처리를 안해주면 오류 발생할 수 있음
        // 100% 예외처리를 해줘야 한다.
        if indexPath.row <= 2{
            cell.backgroundColor = .yellow
        } else {
            cell.backgroundColor = .white
        }
        
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = .systemFont(ofSize: 28)
        
        print(#function, indexPath)
        return cell
    }
    
    // 3. 셀의 높이 : heightForRowAt
    // 다양한 Cell 의 높이를 설정할때 필요
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // 4. 셀을 클릭 했을 때 실행
    // 중요한 점은 Data 가 달라지면 View 를 갱신한다.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        
        list.remove(at: indexPath.row)
        
//        tableView.reloadData()
    }

    

}
