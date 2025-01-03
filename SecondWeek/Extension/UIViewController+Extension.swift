//
//  UIViewController+Extension.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/2/25.
//

import UIKit


extension UIViewController {
    
    // 강의자료 Alert 매크로 확인
    
    
//    let nickname = "고래밥"
    
    
    func setViewBackground() {
        view.backgroundColor = .lightGray
    }
    
    
    func setLabel(label: UILabel,text: String) {
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .green
        label.textAlignment = .center
        label.text = text
    }
    
}




