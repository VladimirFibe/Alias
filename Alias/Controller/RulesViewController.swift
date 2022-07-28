//
//  RulesViewController.swift
//  Alias
//
//  Created by Alexander Altman on 27.07.2022.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var RulesLable: UILabel!
    
    
    let rules = Rules()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RulesLable.text = rules.rules
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
   
}
