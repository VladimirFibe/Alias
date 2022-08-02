//
//  ChoiceController.swift
//  Alias
//
//  Created by Roman on 27.07.2022.
//

import UIKit

class ChoiceController: UIViewController {
    
    @IBOutlet weak var rounds: UISlider!
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    @IBAction func teamSlider(_ sender: UISlider) {
        let team = String(format: "%.f", sender.value)
        personsLabel.text = "\(team)"
    }
    @IBAction func roundSlider(_ sender: UISlider) {
        let round = String(format: "%.f", sender.value)
        roundsLabel.text = "\(round)"
    }
    
    
    @IBAction func backToMainPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goBackToMain", sender: self)
        
    }
    @IBAction func goToThemesPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToThemes", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToThemes" {
            let controller = segue.destination as!ThemesViewController
            controller.rounds = Int(rounds.value)
        }
    }
}
