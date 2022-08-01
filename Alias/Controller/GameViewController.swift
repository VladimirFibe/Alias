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
    @IBOutlet var buttonSkip: UIButton!
    @IBOutlet var buttonYes: UIButton!
    @IBOutlet var buttonFail: UIButton!
    @IBOutlet weak var bonusStar: UIImageView!
    @IBOutlet weak var timerLable: UILabel!
    
    var roundTimer = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    var game = Game()
    var round = 2

    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateBackTimer), userInfo: nil, repeats: true)
        
        
        //round = 3 // количество раундов - нужно подгрузить из слайдера
        let topic = topics.newYear.rawValue //выбранная тема - нужно подгрузить из тем
        game.createGame(topic: topic, round: round)
        

    }
    
    @objc func updateBackTimer() {
        if roundTimer > 0 {
            timerLable.text = "\(roundTimer)"
            roundTimer -= 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wordLable.text = game.getWord(result: button.skip)
        scoreLable.text = String(game.getPoints())
        actionOn()
        updateUI()
    }
    
    
    
    
    @IBAction func failButton(_ sender: UIButton) {
        // минус балл
        let url = Bundle.main.url(forResource: "fail-buzzer-01", withExtension:"mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        wordLable.text = game.getWord(result: button.fail)
        scoreLable.text = String(game.getPoints())
        actionOn()
    }
    
    
    @IBAction func skipButton(_ sender: UIButton) {
        // показать следующее слово
        let url = Bundle.main.url(forResource: "swipe", withExtension:"wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        wordLable.text = game.getWord(result: button.skip)
        scoreLable.text = String(game.getPoints())
        actionOn()
        }
    
    @IBAction func yesButton(_ sender: UIButton) {
        //плюс балл
        let url = Bundle.main.url(forResource: "right", withExtension:"wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        wordLable.text = game.getWord(result: button.yes)
        scoreLable.text = String(game.getPoints())
        actionOn()

        
    }
    
    func actionOn(){
        if game.getActionOn(){
            buttonSkip.isHidden = true
//            buttonYes.setTitle("Согласен", for: .normal)
//            buttonFail.setTitle("Отказ", for: .normal)
            bonusStar.isHidden = false
            
        }
        else {
            buttonSkip.isHidden = false
//            buttonYes.setTitle("Угадано", for: .normal)
//            buttonFail.setTitle("Пропуск", for: .normal)
            bonusStar.isHidden = true
        }
    }
    
    func roundEnd(){
        if game.getCurrentRound() < round {
            game.changedCurrentRound()
            print("раунд закончился")
            performSegue(withIdentifier: "goJoke", sender: "nil")
        }
        else {
            print("Вывод результатов")
            game.changedCurrentRound()
            performSegue(withIdentifier: "results", sender: "nil")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goJoke" {
            guard let destination = segue.destination as? JokeViewController else { return }
            destination.game = game
        }
        else if segue.identifier == "results" {
            guard let destination = segue.destination as? ResultsViewController else { return }
            destination.game = game
            
        }

    }

func updateUI() {
    timer.invalidate()
    roundTimer = 60
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
            if percentageProgress == 0.95 {
                let url = Bundle.main.url(forResource: "lastSeconds", withExtension:"wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
        } else {
            timer.invalidate()
            let url = Bundle.main.url(forResource: "roundEnd", withExtension:"wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            roundEnd()
        }
    }
}
