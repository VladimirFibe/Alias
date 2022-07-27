//
//  ViewController.swift
//  Alias
//
//  Created by Vladimir Fibe on 26.07.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        // переход на экран с игрой
        self.performSegue(withIdentifier: "goToThemes", sender: self)
    }
    
    @IBAction func rulesButtonPressed(_ sender: UIButton) {
      // переход на экран с правилами
        self.performSegue(withIdentifier: "goToRules", sender: self)
    }
    
    }

