//
//  ResultsViewController.swift
//  roshambo_Rock
//
//  Created by Souji on 3/12/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import UIKit


enum rockPaperScissorResult: String {
    
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomShape()->rockPaperScissorResult {
        
        let shapes = ["Rock","Paper","Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return rockPaperScissorResult(rawValue: shapes[randomChoice])!
    }
    
}


class ResultsViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelInfo: UILabel!
    var userChoice: rockPaperScissorResult!
    let opponentChoice: rockPaperScissorResult = rockPaperScissorResult.randomShape()
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        display()
    }
    
    private func display(){
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercaseString
        imageView.image = UIImage(named: imageName)
        labelInfo.text = text
        
    }
    
    @IBAction func playAgain(sender: UIButton) {
        
      dismissViewControllerAnimated(true, completion: nil)
    }

}

