//
//  NumberViewController.swift
//  SecondWeek
//
//  Created by 변정훈 on 12/30/24.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    let pattern: String = "^[0-9]*$"
    
    
    @discardableResult func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        
        let today = format.string(from: Date())
        print(today)
        return today
    }
    
    func randomInt() -> Int {
        Int.random(in: 1...100)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 5. 함수의 반환값
        dateLabel.text = getToday() // 1. 오늘 날짜를 가져오는구나
        dateLabel.textAlignment = .center
        
        setViewBackground()
        
        getToday()
        
        
        // UserDefaults 에 저장된 데이터 가져오기
        // 잘못 가져올수도 있기에 옵셔널 값이다
        let data = UserDefaults.standard.string(forKey: "number")
        numberTextField.text = data
        
        // NS = NextStep
        print(NSHomeDirectory())
        
    }

    @IBAction func textFieldTextChanged(_ sender: UITextField) {
        
//        resultLabel.text = numberTextField.text
        
//        if let text = numberTextField.text?.range(of: pattern, options: .regularExpression) {
//            resultLabel.text = numberTextField.text
//        } else {
//            resultLabel.text = "숫자가 아닙니다."
//        }
        
        guard let text = numberTextField.text else {
            print("nil")
            return
        }
        
        // 새로운 해결방법 새롭다 ***
//        if let intText = Int(text) {
//            print(intText)
//            resultLabel.text = String(intText)
//        } else {
//            print("숫자가 아닙니다.")
//            resultLabel.text = "숫자가 아닙니다."
//        }
        guard let intText = Int(text) else {
            print("intText 이 nil 이다.")
            resultLabel.text = "숫자가 아닙니다."
            return
        }
        
        resultLabel.text = "\(intText)"
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        // 텍스트 필드에 적었던 내용을 영구적으로 저장!
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        print(#function)
        
        /// 6. Alert
        // 성공적으로 저장이 되었는지 알림을 주기
        // Alert, 안드로이드에서는 Diaglog
        // Alert 과 Action Sheet
        
        // 1. 타이틀 + 메시지
        let saveAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 2. 버튼
        // .cancel 이 2개이상이면 앱 터짐 무조건 1개여야 한다.
        let ok = UIAlertAction(title: "확인", style: .cancel)
        let test1 = UIAlertAction(title: "테스트1", style: .default)
        let test2 = UIAlertAction(title: "테스트2", style: .default)
        let test3 = UIAlertAction(title: "테스트3", style: .default)
        
        // 3. 본문에 버튼 추가
        // addAction 의 순서에따라서 추가된다.
        saveAlert.addAction(ok)
        saveAlert.addAction(test1)
        saveAlert.addAction(test2)
        saveAlert.addAction(test3)
        
        // 4. 화면에 띄우기
        present(saveAlert, animated: true)
        
      
        
        
    }
    
    
   

}
