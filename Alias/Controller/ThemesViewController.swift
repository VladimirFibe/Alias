//
//  ThemesViewController.swift
//  Alias
//
//  Created by Roman on 27.07.2022.
//

import UIKit

class ThemesViewController: UIViewController {
    
    
    @IBAction func backToMainButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goBackToMain", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
