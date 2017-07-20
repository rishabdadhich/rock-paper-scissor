//
//  ViewController.swift
//  stone paper scissor
//
//  Created by Rishabh on 22/04/1939 Saka.
//  Copyright © 1939 Saka rishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockButton(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        controller.userChoice = getUserShape(sender )
// If you want to present the new ViewController then use this
//        present(controller, animated: true, completion: nil)
        
        // If you want to push to new ViewController then use this
        self.navigationController?.pushViewController(controller, animated: true)

        
    }

    @IBAction func paperButton(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play"{
            let controller = segue.destination as! ResultViewController
            controller.userChoice = getUserShape(sender as! UIButton)
        }
    }

    func getUserShape(_ sender:UIButton) -> shape {
        let shapes = sender.title(for: UIControlState())!
        return shape(rawValue: shapes)!
}
}
