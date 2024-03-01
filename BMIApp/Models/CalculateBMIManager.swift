//
//  CalculateBMIManager.swift
//  BMIApp
//
//  Created by 이가을 on 3/1/24.
//

import UIKit

struct CalculateBMIManager {
    
    // 계산된 BMI 담을 변수
    var bmi: Double?
    
    
    // BMI 계산
    // ⭐️mutating 키워드: 속성을 변경하는 함수를 쓸 때 써줘야 함
    mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
        }
        bmi = round((w / pow(h/100, 2)) * 100 / 100)
    }
    
    // 계산된 BMI VC에게 전달할 함수
    func getBMIResult() -> Double {
        return bmi ?? 0.0 // 만약 bmi가 nil일 경우 0.0 반환!
    }

    // 레이블 색상 설정
    func getLabelText() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }

    // 레이블 배경 색상 설정
    func getLabelBackColor() -> UIColor {
        guard let bmi = bmi else { return .black }
        switch bmi {
        case ..<18.6:
            return .cyan
        case 18.6..<23.0:
            return .green
        case 23.0..<25.0:
            return .magenta
        case 25.0..<30.0:
            return .orange
        case 30.0...:
            return .red
        default:
            return .black
        }
    }
}
