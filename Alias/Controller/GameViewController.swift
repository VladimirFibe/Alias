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
    
    let roundTimer = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    @IBAction func skipButton(_ sender: UIButton) {
    }
    
    @IBAction func failButton(_ sender: UIButton) {
    }
    
    @IBAction func yesButton(_ sender: UIButton) {
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
            print(percentageProgress)
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
