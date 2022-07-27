//
//  ChoiceController.swift
//  Alias
//
//  Created by Roman on 27.07.2022.
//

import UIKit

class ChoiceController: UIViewController {
    
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    
    @IBAction func backToMainPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goBackToMain", sender: self)
    }
    @IBAction func goToThemesPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToThemes", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personsLabel.text = "Количество команд"
        roundsLabel.text = "Количество раундов"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
