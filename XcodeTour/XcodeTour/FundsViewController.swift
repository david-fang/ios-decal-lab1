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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func discoverFunds() {
        let url = NSURL(string: fundsURL)
        let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
            
            let amountLeft = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        
            //TODO: Search for and find a suitable constant. Remember, use "po" to type in swift code into the debugger.
            //YOU MAY NOT USE INTEGER VALUES HERE, THERE IS A PREDEFINED CONSTANT SOMEWHERE IN THE PROJECT THAT YOU HAVE TO FIND
            //amountLeft += 0
            
            if Int(amountLeft) == 1000000 {
                self.success()
            } else {
                self.fail()
            }
        }
        task.resume()
    }
    
    func success() {
        textView.text = "Congrats, you've recovered the public funds and finished this lab!"
        textView.textColor = UIColor.green
        imageView.image = UIImage(named: "nice")
    }

    func fail() {
        textView.text = "Oops, you've recovered the wrong amount, remember to carefully pick the value"
        imageView.image = UIImage(named: "tryagain")
    }

    func print(_ items: Any?) {
        //You are not allowed to use print to debug!
        print("DON'T USE PRINT STATEMENT")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
