//
//  ClassStruct.swift
//  SecondWeek
//
//  Created by 변정훈 on 1/2/25.
//

import Foundation


// 1. 가지고 있는 프로퍼티를 모두 초기화
// 2. 가지고 있는 프로퍼티를 옵셔널로 선언
class Monster {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    // init 도 함수다
    init(clothes: String, speed: Int, power: Int, experience: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
    }
    
}

// 상속받는 Class 에서 사용하려면 초가화가 필수
class BossMonster: Monster {
    
}

class SuperMonster: BossMonster {
    
}




// struct 는 왜 초기화를 하지 않아도 문제가 없나?
struct MonsterStruct {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    
    // init 이 없더라도 기본적으로 제공해줌!! -> 멤버와이즈 (프로퍼티, 메서드) 초기화 구문
    
}
