//
//  ViewController.swift
//  Midterm-Nintendo-Jordan-Castillo
//
//  Created by Jordan Castillo on 10/22/20.
//

import UIKit

class ViewController: UIViewController {
    
    struct VideoGames {
        var gameID = Int()
        var gameName: String
        var gamePrice: Double
        var gameImageName: String
        }//end of struct
    
    struct GameOrder {
        var gameID = Int()
    }
    //array of Nintendo video games
    var videoGame = [
        VideoGames(gameID: 0, gameName: "Breath of the Wild", gamePrice: 49.99, gameImageName: "breath of the wild"),
        VideoGames(gameID: 1, gameName: "Fire Emblem Three Houses", gamePrice: 44.99, gameImageName: "fe three houses"),
        VideoGames(gameID: 2, gameName: "Pokemon Shield", gamePrice: 40.99, gameImageName: "pokemon shield"),
        VideoGames(gameID: 3, gameName: "Super Mario Odyssey", gamePrice: 54.99, gameImageName: "super mario odyssey"),
        VideoGames(gameID: 4, gameName: "Super Smash Bros Ultimate", gamePrice: 59.99, gameImageName: "super smash bros ultimate")]
    
    var gameOrders: [GameOrder] = []
    
    
    @IBOutlet weak var gameImageView: UIImageView!
    

    @IBOutlet weak var gamePriceLabel: UITextField!
    
    
    @IBOutlet weak var totalPaymentTxtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameImageView.image = UIImage(named: videoGame[0].gameImageName)
        gameImageView.tag = videoGame[0].gameID
        gamePriceLabel.text = "\(videoGame[0].gameName): $\(videoGame[0].gamePrice)"
        totalPaymentTxtView.text = "Total Amount: $0.0"
    }
    
    
    @IBAction func nextGameButtonPressed(_ sender: UIButton) {
        var index = gameImageView.tag + 1
        if index == videoGame.count {
            index = 0
        }
        // show image of the game name
        gameImageView.image = UIImage(named: videoGame[index].gameImageName)
        //grab the image
        gameImageView.tag = index
        // show the information for the game name and its price
        gamePriceLabel.text = "\(videoGame[index].gameName): $\(videoGame[index].gamePrice)"
    }
    
    
    @IBAction func orderGameButtonPressed(_ sender: UIButton) {
        //append the game to the order
        gameOrders.append(GameOrder(gameID: gameImageView.tag))
        
        var totalAmount = 0.0
        var gameReceipt = ""
        
        //this order is from which game
        for orderIndex in 0 ..< gameOrders.count {
            let gameIndex = gameOrders[orderIndex].gameID
            
            //figure out the game name
            let thisGameName = videoGame[gameIndex].gameName
            
            //figure out game price
            let thisGamePrice = videoGame[gameIndex].gamePrice
            
            gameReceipt = gameReceipt + "\n" + "\(thisGameName): $\(thisGamePrice)"
            
            totalAmount = totalAmount + thisGamePrice
        }
        
        //after you jump out the loop
        //show all the orders
        totalPaymentTxtView.text = gameReceipt + "\n" + "Total Amount: $\(totalAmount)"
    }
    


}

