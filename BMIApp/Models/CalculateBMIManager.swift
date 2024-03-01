//
//  CalculateBMIManager.swift
//  BMIApp
//
//  Created by 이가을 on 3/1/24.
//

import UIKit

struct CalculateBMIManager {
    
    // 계산된 BMI 담을 변수
    var bmi: BMI?
    
    // ⭐️mutating 키워드: 속성을 변경하는 함수를 쓸 때 써줘야 함
    // 계산된 BMI 및 변경 정보를 VC에게 전달하는 메서드
    mutating func getBMI(height: String, weight: String) -> BMI {
        calculateBMI(height: height, weight: weight) //
        return bmi ?? BMI(value: 0.0, labelColor: .white, comment: "error") // 만약 bmi가 nil일 경우 ?? 뒤 반환!
    }
    
    // BMI 계산하는 내부 메서드(계산 및 레이블 색상, 코멘트)
    mutating private func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(value: 0.0, labelColor: .white, comment: "error")
            return
        }
        
        var bmiNum = round((w / pow(h/100, 2)) * 100 / 100)

        switch bmiNum {
        case ..<18.6:
            bmi = BMI(value: bmiNum, labelColor: .cyan, comment: "저체중")
        case 18.6..<23.0:
            bmi = BMI(value: bmiNum, labelColor: .green, comment: "표준")
        case 23.0..<25.0:
            bmi = BMI(value: bmiNum, labelColor: .magenta, comment: "과체중")
        case 25.0..<30.0:
            bmi = BMI(value: bmiNum, labelColor: .orange, comment: "중도비만")
        case 30.0...:
            bmi = BMI(value: bmiNum, labelColor: .red, comment: "고도비만")
        default:
            bmi = BMI(value: 0.0, labelColor: .white, comment: "error")
        }
    }

}
