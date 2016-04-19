//
//  SingleMatch.swift
//  roshambo_Rock
//
//  Created by Souji on 4/19/16.
//  Copyright © 2016 Souji. All rights reserved.
//

import Foundation
import Foundation


struct RPSMatch {
    
    let p1: RPS
    let p2: RPS
    let date: NSDate
    
    
    init(p1: RPS,p2: RPS) {
        self.p1 = p1
        self.p2 = p2
        self.date = NSDate()
    }
    
    var winner: RPS {
        get {
            return p1.defeats(p2) ? p1 : p2
        }
    }
    
    var loser: RPS {
        get {
            return p1.defeats(p2) ? p2 : p1
        }
    }
}