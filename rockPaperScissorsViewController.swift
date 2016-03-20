//
//  rockPaperScissorsViewController.swift
//  roshambo_Rock
//
//  Created by Souji on 3/12/16.
//  Copyright © 2016 Souji. All rights reserved.
//
import UIKit
import Foundation


class rockPaperScissorsViewController: UIViewController {
    
    
    
    @IBAction private func rockButton(sender: UIButton){
        
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        
        controller.userChoice = getUserShape(sender)
        
        presentViewController(controller, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction private func paperButton(sender: UIButton){
        
        
        performSegueWithIdentifier("play", sender: sender)
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "play" {
            let controller = segue.destinationViewController as! ResultsViewController
            controller.userChoice = getUserShape(sender as! UIButton)
            
        }
        
    }
    
    private func getUserShape(sender: UIButton) -> rockPaperScissorResult {
        
        let shape = sender.titleForState(.Normal)!
        return rockPaperScissorResult(rawValue: shape)!
        
    }
    
    
}
