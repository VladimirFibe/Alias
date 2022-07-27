//
//  RulesViewController.swift
//  Alias
//
//  Created by Alexander Altman on 27.07.2022.
//

import UIKit

class RulesViewController: UIViewController {

    @IBOutlet weak var rulesScrollView: UIScrollView!
    @IBOutlet weak var rulesLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
