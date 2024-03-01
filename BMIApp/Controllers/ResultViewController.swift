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
    
    var bmi: Double?
    var comment: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        reCalculateButton.clipsToBounds = true
        reCalculateButton.layer.cornerRadius = 5
        
        resultLabel.clipsToBounds = true
        resultLabel.layer.cornerRadius = 5
        
        guard let bmi = bmi else { return }
        resultLabel.text = String(bmi)
        commentLabel.text = comment
        resultLabel.backgroundColor = color
    }
    
    @IBAction func reCalculateButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
