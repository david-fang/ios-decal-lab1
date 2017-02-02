import UIKit

class DefineVariableViewController: UIViewController {

    //Define any instance variables here
    var formattedTextArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        getTextToDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func matchTheArrayHere() {
        performSegue(withIdentifier: "toNice", sender: nil)
    }
    
    func getTextToDisplay() {
        let data1 = [1701013838, 1919899424, 1847602283, 1830844271, 543520367, 1948282479, 1752440943, 1701716069, 1931506808, 1701273972]
        let data2 = Data(buffer: UnsafeBufferPointer(start: data1, count: data1.count))
        let data3 = NSString(data: data2, encoding: String.Encoding.utf8.rawValue)
        let formattedText = (data3?.capitalized)!
        self.formattedTextArray = [formattedText]

        // TODO: You have to somehow find a way to transfer the values from formattedTextArray to the textToDisplay
        // Hint: You need to find a way to store the value so you can access it in a different function
        
        matchTheArrayHere()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? NiceWorkViewController {
            
            // TODO: Get textToDisplay to equal formattedTextArray
            destinationVC.textToDisplay = self.formattedTextArray
        }
    }
}

