//
//  ResultsViewController.swift
//  Alias
//
//  Created by mac on 29.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var textResults: UILabel!
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(game.pointsOfRounds)
        var stringForResults = ""
        for i in 1...game.pointsOfRounds.count{
            stringForResults += "Раунд № \(i): \(game.pointsOfRounds[i]!)\n"
            
        }
        print(stringForResults)
        textResults.text = stringForResults

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
