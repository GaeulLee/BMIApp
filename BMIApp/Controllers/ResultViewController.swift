//
//  ResultViewController.swift
//  BMIApp
//
//  Created by 이가을 on 2/28/24.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var reCalculateButton: UIButton!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        // 전화면(VC)에서 전달받은 데이터를 통해 값 설정
        guard let bmi = bmi else { return }
        
        resultLabel.text = "\(bmi.value)"
        resultLabel.backgroundColor = bmi.labelColor
        commentLabel.text = bmi.comment
        

    }
    
    func setUI(){
        reCalculateButton.clipsToBounds = true
        reCalculateButton.layer.cornerRadius = 5
        
        resultLabel.clipsToBounds = true
        resultLabel.layer.cornerRadius = 5
    }
    
    @IBAction func reCalculateButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
