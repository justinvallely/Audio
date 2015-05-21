//
//  ViewController.swift
//  Audio
//
//  Created by Justin Vallely on 5/20/15.
//  Copyright (c) 2015 JMVapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        
        // Can use .currentTime with a slider for a progress bar
        player.currentTime = 0
    }
    
    @IBOutlet var sliderValue: UISlider!
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        // Both player volume and slider value are by default 0-1
        player.volume = sliderValue.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var audioPath = NSBundle.mainBundle().pathForResource("beethoven1", ofType: "mp3")!
        
        var error: NSError? = nil
        
        // convert audio path to URL to play with the player, use & to point error
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        if error == nil {
            player.play()
        } else {
            println(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

