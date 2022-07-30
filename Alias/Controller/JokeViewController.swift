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
    var joke = Joke()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textRound.text = "Раунд № \(game.getCurrentRound())"


        joke.delegate = self
        joke.getJoke()
        
    }
    
    @IBAction func start(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension JokeViewController: JokeDelegate{
    func didgetJoke(jokeQuestin: String, jokeAnswer: String) {
        
        DispatchQueue.main.async { [self] in //это асинхронный поток
            textJoke.text = "\(jokeQuestin)\n\n \(jokeAnswer)"
        }
        
    }
    
    func didFailWithError(error: Error) {
        print("error")
    }
    
    
}
