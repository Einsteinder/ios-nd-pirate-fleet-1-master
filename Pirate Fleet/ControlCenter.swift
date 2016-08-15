//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine:_Mine_{
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: false)
        let littleShip1 = Ship(length: 2, location: GridLocation(x: 0, y: 2), isVertical: false)
        let bigship1 = Ship(length: 4, location: GridLocation(x: 0, y: 3), isVertical: false)
        let verybigship1 = Ship(length: 5, location: GridLocation(x: 0, y: 4), isVertical: false)
        
        let mine1 = Mine(location: GridLocation(x: 0,y: 5), explosionText: "Mine 1 explode")
        let mine2 = Mine(location: GridLocation(x: 0,y: 6), explosionText: "Mine 2 explode")
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(littleShip1)
        human.addShipToGrid(bigship1)
        human.addShipToGrid(verybigship1)
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        // Write your code here!
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        let humanShipsRemaining = 5 - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfMissesByHuman
        
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        return finalScore
    }
}