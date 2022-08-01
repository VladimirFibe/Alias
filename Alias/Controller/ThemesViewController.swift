//
//  ThemesViewController.swift
//  Alias
//
//  Created by Roman on 27.07.2022.
//

import UIKit

class ThemesViewController: UIViewController {
  var topic = "Легкий"
  var rounds = 2 { didSet { print(rounds)}}
  
  @IBAction func backToMainButton(_ sender: UIButton) {
    self.performSegue(withIdentifier: "goBackToChoice", sender: self)
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) { //общая функция для всех кнопок
    topic = sender.titleLabel?.text ?? "Легкий"
    self.performSegue(withIdentifier: "goToGame", sender: self)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToGame" {
      let controller = segue.destination as! GameViewController
      controller.round = rounds
    }
    print(#function, rounds, topic)
  }
  
  
  @IBOutlet weak var theme1Button: UIButton!
  @IBOutlet weak var theme2Button: UIButton!
  @IBOutlet weak var theme3Button: UIButton!
  @IBOutlet weak var theme4Button: UIButton!
  @IBOutlet weak var backButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    theme1Button.layer.cornerRadius = 20
    theme2Button.layer.cornerRadius = 20
    theme3Button.layer.cornerRadius = 20
    theme4Button.layer.cornerRadius = 20
    backButton.layer.cornerRadius = 20
    
    theme1Button.setTitle(topics.easy.rawValue, for: .normal)
    theme2Button.setTitle(topics.normal.rawValue, for: .normal)
    theme3Button.setTitle(topics.hard.rawValue, for: .normal)
    theme4Button.setTitle(topics.newYear.rawValue, for: .normal)
    
  }
  
}
