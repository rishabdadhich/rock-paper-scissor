//
//  ResultViewController.swift
//  stone paper scissor
//
//  Created by Rishabh on 22/04/1939 Saka.
//  Copyright © 1939 Saka rishi. All rights reserved.
//

import UIKit

enum shape:String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomShapes() -> shape{
        let shapes = ["Rock","Paper","Scissors"]
        let randomNo = Int(arc4random_uniform(3))
        return shape(rawValue: shapes[randomNo])!
    }
}



class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var imageView1: UIImageView!

    @IBOutlet weak var textLabel: UILabel!
    
    
    var userChoice : shape!
    var oponentChoice = shape.randomShapes()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    func displayResult() {
        var imageName:String
        var text:String
        let match = "\(userChoice.rawValue)vs\(oponentChoice.rawValue)"
        
        switch (userChoice!,oponentChoice) {
        case (.Rock,.Rock),(.Paper,.Paper),(.Scissors,.Scissors):
            text = "\(match) its a tie"
            imageName = "tie"
        case (.Rock,.Scissors),(.Paper,.Rock),(.Scissors,.Paper):
            text = "you win with \(match)"
           imageName = "\(userChoice.rawValue)-\(oponentChoice.rawValue)"
        default:
            text = "you loose with \(match)"
            imageName = "\(oponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        imageName = imageName.lowercased()
    imageView1.image = UIImage(named: imageName)
        textLabel.text = text
        
    }
    

    @IBAction func playAgain(_ sender: Any) {
        if let navigationController = navigationController{
            navigationController.popViewController(animated: true)
        }

    }
}
