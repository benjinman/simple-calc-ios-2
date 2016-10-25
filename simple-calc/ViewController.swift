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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func one(_ sender: AnyObject) {
    }
    
    @IBAction func two(_ sender: AnyObject) {
    }
    
    @IBAction func three(_ sender: AnyObject) {
    }
    
    @IBAction func four(_ sender: AnyObject) {
    }
    
    @IBAction func five(_ sender: AnyObject) {
    }
    
    @IBAction func six(_ sender: AnyObject) {
    }
    
    @IBAction func seven(_ sender: AnyObject) {
    }
    
    @IBAction func eight(_ sender: AnyObject) {
    }
    
    @IBAction func nine(_ sender: AnyObject) {
    }
    
    @IBAction func zero(_ sender: AnyObject) {
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
    }
}

