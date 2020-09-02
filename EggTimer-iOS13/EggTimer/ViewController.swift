//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard":7]
    var counter = 0
    var timer = Timer()
    var totalTime = 0
    
    @IBOutlet weak var bar: UIProgressView!
    
    @IBOutlet weak var label: UILabel!
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        timer.invalidate()
        bar.progress = 0.0
        counter = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        label.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        //updateCounter()
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds")
            counter -= 1
            var percentage = Float (Float(counter)/Float(totalTime))
            bar.progress = Float(1-percentage)
        } else {
            timer.invalidate()
            label.text = "Done"
            playSound(name:"alarm_sound")
        }
    }
    
    func playSound(name:String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
