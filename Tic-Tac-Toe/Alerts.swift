//
//  Alerts.swift
//  Tic-Tac-Toe
//
//  Created by Pavel Otverchenko on 01.09.2021.
//

import SwiftUI

struct AlertItem : Identifiable {
    
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    
    static let humanWin     = AlertItem(title: Text("You win!"),
                                        message: Text("You are smart"),
                                        buttonTitle: Text("Yeah baby!"))
    
    static let computerWin  = AlertItem(title: Text("Computer wins!"),
                                        message: Text("You are a dumb bitch"),
                                        buttonTitle: Text("Suck it!"))
    
    static let draw         = AlertItem(title: Text("Draw!"),
                                        message: Text("Fair enough"),
                                        buttonTitle: Text("Okay"))
}
