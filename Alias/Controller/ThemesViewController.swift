//
//  ThemesViewController.swift
//  Alias
//
//  Created by Roman on 27.07.2022.
//

import UIKit

class ThemesViewController: UIViewController {
    
    
    @IBAction func theme1Pressed(_ sender: UIButton) {
    }
    @IBAction func theme2Pressed(_ sender: UIButton) {
    }
    @IBAction func theme3Pressed(_ sender: UIButton) {
    }
    @IBAction func theme4Pressed(_ sender: UIButton) {
    }
    @IBAction func backToMainButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goBackToChoice", sender: self)
    }
    
    @IBAction func buttonPressed(_ sender: Any) { //общая функция для всех кнопок
        
        var words = Words()
        print((sender as AnyObject).currentTitle)
        words.defineWordsArray(topic: (sender as AnyObject).currentTitle!) //определяем массив слов
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
