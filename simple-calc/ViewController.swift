//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 10/25/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var result: UITextField!
    public final let operators : [String] = ["+", "-", "x", "/", "%", "count", "avg", "fact"]
    public var oprtr: ((Int, Int) -> Int)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func one(_ sender: AnyObject) {
        addNumber(1)
    }
    
    @IBAction func two(_ sender: AnyObject) {
        addNumber(2)
    }
    
    @IBAction func three(_ sender: AnyObject) {
        addNumber(3)
    }
    
    @IBAction func four(_ sender: AnyObject) {
        addNumber(4)
    }
    
    @IBAction func five(_ sender: AnyObject) {
        addNumber(5)
    }
    
    @IBAction func six(_ sender: AnyObject) {
        addNumber(6)
    }
    
    @IBAction func seven(_ sender: AnyObject) {
        addNumber(7)
    }
    
    @IBAction func eight(_ sender: AnyObject) {
        addNumber(8)
    }
    
    @IBAction func nine(_ sender: AnyObject) {
        addNumber(9)
    }
    
    @IBAction func zero(_ sender: AnyObject) {
        if result.text != nil && result.text != "" {
            result.text! += "0"
        }
    }
    
    func addNumber(_ number: Int) {
        if (result.text == "0") {
            result.text! = String(number)
        } else {
            result.text! += String(number)
        }
    }
    
    @IBAction func count(_ sender: AnyObject) {
        result.text! += " count "
    }
    
    @IBAction func fact(_ sender: AnyObject) {
        result.text! += " fact "
    }
    
    @IBAction func avg(_ sender: AnyObject) {
        result.text! += " avg "
    }
    
    @IBAction func add(_ sender: AnyObject) {
        result.text! += " + "
        oprtr = add
    }
    
    @IBAction func subtract(_ sender: AnyObject) {
        result.text! += " - "
        oprtr = subtract
    }
    
    @IBAction func multiply(_ sender: AnyObject) {
        result.text! += " * "
        oprtr = multiply
    }
    
    @IBAction func divide(_ sender: AnyObject) {
        result.text! += " / "
        oprtr = divide
    }
    
    @IBAction func modulo(_ sender: AnyObject) {
        result.text! += " % "
        oprtr = mod
    }

    @IBAction func clear(_ sender: AnyObject) {
        result.text! = ""
    }
    
    func add(left : Int, right : Int) -> Int {
        return left + right
    }
    
    func subtract(left : Int, right : Int) -> Int {
        return left - right
    }
    
    func multiply(left : Int, right : Int) -> Int {
        return left * right
    }
    
    func divide(left : Int, right : Int) -> Int {
        return left / right
    }
    
    func mod(left : Int, right : Int) -> Int {
        return left % right;
    }
    
    func mathOperation(left : Int, right : Int, operation: (Int, Int) -> Int) -> Int {
        return operation(left, right);
    }
    
    func count(nums: [Int]) -> Int {
        return nums.count
    }
    
    func avg(nums: [Int]) -> Int {
        var sum = 0
        for num in nums {
            sum += num
        }
        return sum / nums.count
    }
    
    func fact(num: Int) -> Int {
        if (num < 0) {
            return -1
        } else if (num == 0 || num == 1) {
            return 1
        }
        
        return num * fact(num: (num - 1))
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        let line = result.text!
        
        var answer : Int = 0;
        if (line.contains("count") || line.contains("avg") || line.contains("fact")) {
            let nums : [String] = line.characters.split(separator: " ").map(String.init);
            
            var numbers : [Int] = [];
            for i in 0...nums.count - 1 {
                if (!operators.contains(String(nums[i]))) {
                    numbers.append(Int(nums[i])!);
                }
            }
            
            if (line.contains("count")) {
                answer = count(nums: numbers);
            } else if (line.contains("avg")) {
                answer = avg(nums: numbers);
            } else if (line.contains("fact")) {
                answer = fact(num: numbers[0]);
            }
            result.text! = String(answer)
        } else if(line.contains("+") || line.contains("-") || line.contains("*") || line.contains("/") || line.contains("%")) {
            let nums = line.characters.split(separator: " ")
            let firstNum : Int = Int(String(nums[0]))!
            let secondNum : Int = Int(String(nums[2]))!
            result.text! = String(mathOperation(left: firstNum, right: secondNum, operation: oprtr!))
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let history = storyboard.instantiateViewController(withIdentifier: "historyController") as! HistoryViewController
        self.present(history, animated: true, completion: nil)
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 15, width: 200, height: 40)
        label.text = "\(line) = \(result.text!)"
        history.addHistory(label)
    }
}

