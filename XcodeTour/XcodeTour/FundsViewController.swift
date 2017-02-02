//
//  FundsViewController.swift
//  XcodeTour
//
//  Created by Akilesh Bapu on 1/31/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FundsViewController: UIViewController {

    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.discoverFunds()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func discoverFunds() {
        let url = NSURL(string: fundsURL)
        let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
            
            var amountLeft = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        
            //TODO: Search for and find a suitable constant. Remember, use "po" to type in swift code into the debugger.
            //YOU MAY NOT USE INTEGER VALUES HERE, THERE IS A PREDEFINED CONSTANT SOMEWHERE IN THE PROJECT THAT YOU HAVE TO FIND
            amountLeft = String(recovery10)
            
            if Int(amountLeft) == 1000000 {
                success()
            } else {
                fail()
            }
        }
        task.resume()
    }
    
    func success() {
        DispatchQueue.main.async {
            self.textView.text = "Congrats, you've recovered the public funds and finished this lab!"
            self.textView.textColor = UIColor.green
            self.imageView.image = UIImage(named: "nice")
        }
    }

    func fail() {
        DispatchQueue.main.async {
            self.textView.text = "Oops, you've recovered the wrong amount, remember to carefully pick the value"
            self.imageView.image = UIImage(named: "tryagain")
        }
    }

    func print(_ items: Any?) {
        //You are not allowed to use print to debug!
        print("DON'T USE PRINT STATEMENT")
    }
}
