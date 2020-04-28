//
//  ViewController.swift
//  MTVPlayer
//
//  Created by Jeff Chen on 1/6/20.
//  Copyright © 2020 Jeff Chen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var playerLayer:AVPlayerLayer?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo(from: "許茹芸.mp4")
    }

    override func viewDidAppear(_ animated: Bool) {
        player?.play()
    }

    private func playVideo(from file:String)
    {
        let file = file.components(separatedBy: ".")

        guard let path = Bundle.main.path(forResource: file[0], ofType:file[1]) else {
            debugPrint( "\(file.joined(separator: ".")) not found")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))

        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer!)

    }
    
    override func viewDidLayoutSubviews()
    {
        playerLayer?.frame = self.view.bounds
    }
    
    @IBAction func onRestart(_ sender: Any)
    {
        player?.seek(to: CMTime.zero)
        player?.play()
    }
}

