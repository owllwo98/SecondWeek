//
//  ViewController.swift
//  SecondWeek
//
//  Created by 변정훈 on 12/30/24.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var recommandButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // titleLabel 보다는 setTitle
//        recommandButton.titleLabel
        
        // 해당 설정을 해야 Tap Gesture 가 인식이 된다. *
        print(resultLabel.isUserInteractionEnabled)
        
        
        // 2. 두 번째 내용
        // 2개의 차이가 무엇인가? isUserInteractionEnabled 는 겉으로는 작동되게 생감
        // 하지만 isEnabled 는 아예 스위치가 꺼지는 느낌? *
        // 여러번 클릭하지 못하게 0.3 초 정도 작동하지 않게 만들기도 한다. TIP *
        resultLabel.isUserInteractionEnabled = true
//        resultLabel.isEnabled = false
        
        
//        posterImageView.image = UIImage(named: "a")
        if let url = URL(string:"https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=9046601&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNC8yMS9DTFM2L2FzYWRhbFBob3RvXzI0MTRfMjAxNDA0MTY=&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10004") {
            posterImageView.kf.setImage(with: url)
        } else {
            posterImageView.image = UIImage(systemName: "star")
        }
    }

    // 1. 첫 번째 내용
    // Did End On Exit
    //UITextField text, UILabel text: String?
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        
        var text = wordTextField.text?.lowercased()
        
        guard let newtext = text else { return
            text = nil
        }
        
        print(newtext)
        
        /// 중요 *
        // text 에 아무것도 입력하지 않았을때 nil 이 아니라 애플에서 자체적으로 배열? 같은 것을 제공한다.
        // wordTextField.text = nil 을 넣더라도 애플이 자체적으로 다른 것을 넣어준다.
        
        // 공백 Case 에서 문제 발생 -> 공백인 WhiteSpace 제거 옵션도 제공 *
        // Refactor 해보자
        if newtext.count == 0 {
            resultLabel.text = "검색어를 작성해주세요"
        } else if text == "jmt" {
            resultLabel.text = "완전맛있음"
        } else {
            resultLabel.text = "\(newtext)로 입력했어요"
        }
    }
    
    @IBAction func labelTapped(_ sender: UITapGestureRecognizer) {
        // 해당함수 불러오기
        print(#function)
    }
    
    
    // 3. 세 번째 내용
    func aboutOptional() {
        // : String? 옵셔널 스트링 타입
        var nickname: String? = "고래밥"
        var age: Int? = 22
        
        nickname = nil
        
        /// 1. 조건문을 통한 옵셔널 언래핑
        if nickname == nil {
            print("닉네임에 문제가 있어요")
        } else {
            print("\(nickname!)으로 설정합니다.")
        }
        
        /// 2. 옵셔널 바인딩 : if let / guard
        // 보통 같은 변수 이름 사용
        
        // (1) if let 
        // if let shorthand let nickname = nickname 으로 2번 쓸 필요없이 if let nickname 으로 한번에 가능
        // if let VS guard let 둘이 사용할 수 있는 범주가 다르다 if let 은 해당 조건문 안에서만 사용가능하지만 guard let 은 전체적으로 사용가능
        if let nickname {
            print("\(nickname)으로 설정합니다.")
        } else {
            print("닉네임에 문제가 있어요")
        }
        
        if let age = age {
            print(age)
        } else {
        print("나이가 nil 입니다.")
        }
        
        print(age) // Int?
        
        // (2) guard let
        // 무조건 'print' 를 찍어보자
        guard let age else {
            print("옵셔널 해제를 실패하여 age 가 nil 입니다.")
            return // return 왜 써? 끝내는 지점 return 을 통해서 nil 이 들어왔을때 생길 수 있는 문제를 방지한다 (중지하면서 뒤에 코드를 실행 안한다.) Like 방어막
        }
        
        print(age) // Int
        
        // (3) ??
        print(nickname ?? "손님")
        
        // (4) 옵셔널 체이닝
        // 해당 코드의 ? 부분
        wordTextField.text?.count
        
        if let text = wordTextField.text {
            print(text.count)
        }
        
      
        
    }
}

