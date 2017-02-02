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
            
            // TODO: Use the debugger to figure out how much money is left (remember, you can use the "po" operator in the console to run Swift code while debugging).
            // Then, determine how much money is missing from our original $1,000,000 and add that back to amountLeft to recover the funds.
            // NOTE: YOU MAY NOT USE INTEGER VALUES HERE; INSTEAD, SEARCH FOR A PREDEFINED CONSTANT WITHIN THE PROJECT THAT YOU CAN REFERENCE IN PLACE OF NUMERICAL VALUES.

            if let remainingFunds = Int(amountLeft) {
                amountLeft = String(remainingFunds + recovery9)
            }
            
            if Int(amountLeft) == 1000000 {
                self.success()
            } else {
                self.fail()
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
