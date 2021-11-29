//
//  ViewController.swift
//  Calculator
//
//  Created by Lily on 11/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    // User's view of the output
    @IBOutlet weak var calUserView: UILabel!
    
    var workings:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    //Clear the calculator each time
    func clearAll()
    {
        workings = ""
        calUserView.text = ""
        
    }
    
    // non-number buttons

    @IBAction func allClearButton(_ sender: Any) {
        clearAll()
    }
    
    // update the workings variable
    func addToWorkings(value: String)
    {
        workings = workings + value
        calUserView.text = workings // displays the tapped user input in the lable
        
    }
    
    @IBAction func percentButton(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideButton(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    
    @IBAction func multiplyButton(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    
    @IBAction func subtractButton(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func equalButton(_ sender: Any) {
        
        if(validInput()) //when user input is vaild do
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01") // when user tapped % sign change it to do *0.01
            
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double // do math and display as a double
            let resultString = formatResult(result: result) // formating decimals
            calUserView.text = resultString
        }
        else
        {
            let alert = UIAlertController( // an altert message, pop up
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //checking if users tapped a vaild input, no double **
    func validInput() -> Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes // checking if the last user input was a symbol
        {
            if(index == 0)
            {
                return false
            }
            if(index == workings.count - 1)
            {
                return false
            }
            if(previous != 1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index // last value entered by the user 
        }
        return true
        
    }
    
    //user tapped more than one function symbol without a number
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        if(char == "-")
        {
            return true
        }
        if(char == "%")
        {
            return true
        }
        return false
    }
    
    //formating the results when its a decimal
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f",result)// no decimal place
        }
        else
        {
            return String(format: "%.3f",result)// max 3 decinal places
        }
    }
    
    
    @IBAction func dotButton(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    
    // number Buttons
    @IBAction func zeroButton(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    
    @IBAction func oneButton(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    
    @IBAction func twoButton(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func threeButton(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    
    @IBAction func fourButton(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    
    @IBAction func sixButton(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    
    @IBAction func sevenButton(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
}

