//
//  TenViewController.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/7/25.
//

import UIKit


// 테이블뷰 아웃렛을 연결해줄 필요가 있을 수 있겠다.
// 테이블뷰를 만들 때 필요한 것들이 있는 것 같은데 -> 수동으로 다 해줘야 함

/*
 1. 테이블 뷰 이름
 2. 테이블 뷰 부하직원 (프로토콜) UITableViewDelegate, UITableViewDataSource
 3. 필수 기능
 4. 테이블 뷰와 부하직원이 서로 연결 ( = 타입으로서의 프로토콜, Protocol as Type)
 */
class TenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        let xib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "NoProfileTableViewCell")
        
        // 4. 테이블 뷰와 부하직원이 서로 연결
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath)
        print(#function)
        cell.backgroundColor = .lightGray
        return cell
    }
    
    

}
