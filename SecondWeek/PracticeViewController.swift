//
//  PracticeViewController.swift
//  SecondWeek
//
//  Created by 변정훈 on 12/31/24.
//

import UIKit

class PracticeViewController: UIViewController {
    
    let colorList: [UIColor] = [.red, .yellow, .green, .orange, .purple, .cyan]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self, #function)
        
    }
    
    // 2023 WWDC
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = colorList.randomElement()!
        print(self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self, #function)
    }
    
    // 스토리보드에서 연결하는게 아니라, 코드로 직접 타이핑
    @IBAction func unwindToPracticeViewController(_ sender: UIStoryboardSegue) {
        print(#function)
    }
    

    

}
