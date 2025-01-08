//
//  UIColor+Extension.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/6/25.
//

import UIKit

extension UIColor {
    
    // 저장 프로퍼티, 인스턴스 프로퍼티
    // 인스턴스가 생성된 이후에 사용할 수 있으니 안된다.
//    var jackColor = UIColor.red
//    var myColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.5)
    
    // 저장 프로퍼티, 타입 프로퍼티
    static var backColor = UIColor.red
    
    // 연산 프로퍼티, 인스턴스 프로퍼티
    // 통로를 통해 red 를 return 해준다.
    var denColor: UIColor {
        return .red
    }
    
}
