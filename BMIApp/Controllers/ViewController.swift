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

    var bmiManager = CalculateBMIManager() // model을 사용허기 위해 인스턴스 생성
    
    
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
        
        bmiManager.calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
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
            
            resultVC.bmi = bmiManager.getBMIResult()
            resultVC.comment = bmiManager.getLabelText()
            resultVC.color = bmiManager.getLabelBackColor()
            
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

