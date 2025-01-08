//
//  BrownViewController.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/7/25.
//

import UIKit

class BrownViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    
    // 1. Pass Data - 데이터를 받을 공간 (프로퍼티 생성)
    var contents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "브라운"
        
        // 3. Pass Data - 전달 받은 값을 화면에 표현
        testLabel.text = contents
    }
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
