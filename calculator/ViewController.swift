//
//  ViewController.swift
//  calculator
//
//  Created by Steven Panesar on 2/12/19.
//  Copyright © 2019 Steven Panesar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables for calculations and logic
    var previousDisplay : String = ""
    var numberValue : String = "0"
    var mathFunction : Int = 0
    var numberInMemory : String = ""
    var calcHappened : Bool = false
    var calculationValue : Double = 0
    
    // Display Screen
    @IBOutlet weak var displayOutput: UILabel!
    
    // Loading Up Screen
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayOutput.text = "0"
    }

    // What Happens when the user presses the decimal button
    @IBAction func decimalPoint(_ sender: UIButton) {
        // If there is already a decimal present in the number, nothing happens
        if (displayOutput.text?.contains("."))!{
            displayOutput.text = displayOutput.text
        }
        // If no decimal is detected, a decimal is added to the end of the number
        else {
            // If the current number is "0", the zero is kept
            if previousDisplay == "" {
                numberValue = "0."
                updateDisplay()
            }
            // Otherwise a decimal is added on its own
            else {
                numberValue = "."
                updateDisplay()
            }
        }
    }
    
    // What happens when the user presses the +/- button
    @IBAction func flipSign(_ sender: UIButton) {
        // The number is searched for a "-" sign. If detected, it is removed
        if (displayOutput.text?.contains("-"))! {
            displayOutput.text = displayOutput.text?.replacingOccurrences(of: "-", with: "")
        }
        // If no "-" is detected, a "-" is added to the beginning of the number
        else {
            displayOutput.text = "-" + displayOutput.text!
        }
    }
    
    // What happens when the user presses the % button
    @IBAction func percentageCalc(_ sender: UIButton) {
        // The number is divided by 100
        displayOutput.text = "\(Double(displayOutput.text!)! / 100)"
    }
    
    // Whan happens when a user presses a number button
    
    //0
    @IBAction func number0(_ sender: UIButton) {
        // If the current display is "0", no updates take place
        if previousDisplay == "0" {
            numberValue = "0"
        }
        // Zero is set to numberValue and display is updated
        else {
            numberValue = "0"
            updateDisplay()
        }
    }
    
    // 1 : numberValue set to 1 and display is updated
    @IBAction func number1(_ sender: UIButton) {
        numberValue = "1"
        updateDisplay()
    }
    // 2 : numberValue set to 1 and display is updated
    @IBAction func number2(_ sender: UIButton) {
        numberValue = "2"
        updateDisplay()
    }
    // 3 : numberValue set to 1 and display is updated
    @IBAction func number3(_ sender: UIButton) {
        numberValue = "3"
        updateDisplay()
    }
    // 4 : numberValue set to 1 and display is updated
    @IBAction func number4(_ sender: UIButton) {
        numberValue = "4"
        updateDisplay()
    }
    // 5 : numberValue set to 1 and display is updated
    @IBAction func number5(_ sender: UIButton) {
        numberValue = "5"
        updateDisplay()
    }
    // 6 : numberValue set to 1 and display is updated
    @IBAction func number6(_ sender: UIButton) {
        numberValue = "6"
        updateDisplay()
    }
    // 7 : numberValue set to 1 and display is updated
    @IBAction func number7(_ sender: UIButton) {
        numberValue = "7"
        updateDisplay()
    }
    // 8 : numberValue set to 1 and display is updated
    @IBAction func number8(_ sender: UIButton) {
        numberValue = "8"
        updateDisplay()
    }
    // 9 : numberValue set to 1 and display is updated
    @IBAction func number9(_ sender: UIButton) {
        numberValue = "9"
        updateDisplay()
    }
    // What happens when the user presses the "+" button
    @IBAction func addNumbers(_ sender: UIButton) {
        // mathFunction set to 1 and the current display is
        // converted to memory, and the display is cleared
        mathFunction = 1
        numberInMemory = displayOutput.text!
        clearDisplayScreen()
        print(mathFunction)
    }
    //What happens when the user presses the "-" button
    @IBAction func subtractNumbers(_ sender: UIButton) {
        // mathFunction set to 2 and the current display is
        // converted to memory, and the display is cleared
        mathFunction = 2
        numberInMemory = displayOutput.text!
        clearDisplayScreen()
    }
    // What happens when the number presses the "X" button
    @IBAction func multiplyNumbers(_ sender: UIButton) {
        // mathFunction set to 3 and the current display is
        // converted to memory, and the display is cleared
        mathFunction = 3
        numberInMemory = displayOutput.text!
        clearDisplayScreen()
    }
    // Whan happens when the user presses the "/" button
    @IBAction func divideNumbers(_ sender: UIButton) {
        // mathFunction set to 4 and the current display is
        // converted to memory, and the display is cleared
        mathFunction = 4
        numberInMemory = displayOutput.text!
        clearDisplayScreen()
    }
    // Whan happens when the user presses the "=" button
    @IBAction func doCalculation(_ sender: UIButton) {
        // Bool calc happened set to true --> important for updateDisplay()
        calcHappened = true
        // The current display is added to the number in memory
        if mathFunction == 1 {
            displayOutput.text = "\(Double(displayOutput.text!)! + Double(numberInMemory)!)"
            previousDisplay = displayOutput.text!
        }
        // The current display subtracted from the number in memory
        else if mathFunction == 2 {
            displayOutput.text = "\(Double(numberInMemory)! - Double(displayOutput.text!)!)"
            previousDisplay = displayOutput.text!
        }
        // The current display is multiplied by the number in memory
        else if mathFunction == 3 {
            displayOutput.text = "\(Double(displayOutput.text!)! * Double(numberInMemory)!)"
            previousDisplay = displayOutput.text!
        }
        // The current display is divided from the number in memory
        else if mathFunction == 4 {
            displayOutput.text = "\(Double(numberInMemory)! / Double(displayOutput.text!)!)"
            previousDisplay = displayOutput.text!
        }
    }
    
    // What happens when the user presses the "AC" button
    @IBAction func clearDisplay(_ sender: UIButton) {
        // The clearDisplayScreen is called
        clearDisplayScreen()
    }
    
    // Functions
    // How the UILabel displayOutput is updated
    func updateDisplay() {
        // The output display is a string of the previous display with the
        // currently pressed number appended to the end of it
        displayOutput.text = previousDisplay + numberValue
        previousDisplay = displayOutput.text!
        // If a calulation has happened, the current display is cleared
        // and the display will show the number pressed
        if calcHappened == true {
            clearDisplayScreen()
            displayOutput.text = previousDisplay + numberValue
            previousDisplay = displayOutput.text!
            calcHappened = false
        }
    }
    // How the clearDisplayScreen function works
    func clearDisplayScreen() {
        // The current display is set to zero and the previous display
        // is cleared
        displayOutput.text = "0"
        previousDisplay = ""
    }
    
}


