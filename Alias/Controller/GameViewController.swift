//
//  GameViewController.swift
//  Alias
//
//  Created by Roman on 28.07.2022.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var wordLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    
    let roundTimer = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    var game = Game()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
        let  round = 3 // количество раундов - нужно подгрузить из слайдера
        let topic = topics.newYear.rawValue //выбранная тема - нужно подгрузить из тем
        game.createGame(topic: topic, round: round)
        wordLable.text = game.getWord(result: button.skip)
        
    }
    
    
    
    
    
    @IBAction func failButton(_ sender: UIButton) {
        // минус балл
        let url = Bundle.main.url(forResource: "fail-buzzer-01", withExtension:"mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        wordLable.text = game.getWord(result: button.fail)
        scoreLable.text = String(game.getPoints())
    }
    
    
    @IBAction func skipButton(_ sender: UIButton) {
        // показать следующее слово
        let url = Bundle.main.url(forResource: "fail-buzzer-01", withExtension:"mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        wordLable.text = game.getWord(result: button.skip)
        scoreLable.text = String(game.getPoints())
        }
    
    @IBAction func yesButton(_ sender: UIButton) {
        wordLable.text = game.getWord(result: button.yes)
        scoreLable.text = String(game.getPoints())
        
    }
    

func updateUI() {
    timer.invalidate()
    totalTime = roundTimer
    timerBar.setProgress(0.0, animated: true)
    secondsPassed = 0
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
}
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            timerBar.progress = percentageProgress
            secondsPassed += 1
        } else {
            timer.invalidate()
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension:"mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
