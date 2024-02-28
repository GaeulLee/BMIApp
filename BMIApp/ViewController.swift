//
//  ViewController.swift
//  BMIApp
//
//  Created by 이가을 on 2/28/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateBtn: UIButton!
    
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - setUI
    func setUI(){
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        calculateBtn.clipsToBounds = true
        calculateBtn.layer.cornerRadius = 5
        
        heightTextField.placeholder = "cm 단위로 입력"
        weightTextField.placeholder = "kg 단위로 입력"
        
        //heightTextField.keyboardType = .numberPad
        //weightTextField.keyboardType = .numberPad
    }

    
    @IBAction func calculateBMIButton(_ sender: UIButton) {
        
        guard let height = heightTextField.text,
              let weight = weightTextField.text
        else { return }
        
        bmi = calculateBMI(height: height, weight: weight)
    }
    
    func calculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight)
        else { return 0.0 }
        
        return round((w / pow(h/100, 2)) * 100 / 100)
    }
    
    func changeLabelText() -> String {
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
    
    func changeLabelBackColor() -> UIColor {
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
    
    // check validation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            print("아무것도 입력되지 않음")
            return false
        }
        return true
    }
    
    // send data to other VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultVC" {
            let resultVC = segue.destination as! ResultViewController
            
            resultVC.bmi = self.bmi
            resultVC.comment = changeLabelText()
            resultVC.color = changeLabelBackColor()
            
            heightTextField.text = ""
            weightTextField.text = ""
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != ""  {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}

