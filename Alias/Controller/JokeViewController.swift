//
//  JokeViewController.swift
//  Alias
//
//  Created by mac on 29.07.2022.
//

import UIKit

class JokeViewController: UIViewController {

    @IBOutlet var textRound: UILabel!
    @IBOutlet var textJoke: UILabel!
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textRound.text = "Раунд № \(game.getCurrentRound())"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
