//
//  ViewController.swift
//  DannyWeiner-Lab1
//
//  Created by Danny Weiner on 9/10/16.
//  Copyright © 2016 cse438s. All rights reserved.
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
    
    var originalPrice=0.0, discount=0.0, salesTax=0.0
    
    @IBOutlet weak var finalPriceField: UITextField!
    @IBOutlet var mainView: UIView!
    @IBAction func textFieldChanged(sender: UITextField) {
        
        switch sender.tag {
        case 0: //originalPrice
            //            print("price changed to " + sender.text!)
            if Double(sender.text!) >= 0.0 {
                originalPrice = Double(sender.text!)!
            } else if Double(sender.text!) == nil {
                originalPrice = 0.0
            }
            break;
        case 1: //discount
            //            print("discount changed to " + sender.text!)
            if Double(sender.text!) >= 0.0 && Double(sender.text!) <= 100.0 {
                discount = Double(sender.text!)!/100.0
            } else if Double(sender.text!) == nil {
                discount = 0.0
            } else if Double(sender.text!) > 100 {
                discount = 100.0
            }
            break;
        case 2: //salesTax
            //            print("tax changed to " + sender.text!)
            if Double(sender.text!) >= 0.0 && Double(sender.text!) <= 100 {
                salesTax = Double(sender.text!)!/100.0
            } else if Double(sender.text!) == nil {
                salesTax = 0.0
            } else if Double(sender.text!) > 100 {
                salesTax = 100.0
            }
            break;
        default:
            fatalError("unknown tag assignment")
        }
        
        var finalPrice = (originalPrice * (1.0 - discount)) * (1.0 + salesTax)
        
        if finalPrice > originalPrice {
            finalPrice = originalPrice
        } else if finalPrice < 0.0 {
            finalPrice = 0.0
        }
        
        let displayText = "$\(String(format: "%.2f", finalPrice))"
        print(displayText)
        finalPriceField.text = displayText
        
        if finalPrice < 5 {
            mainView.backgroundColor = UIColor.cyanColor()
        } else if finalPrice > 5 && finalPrice < 10 {
            mainView.backgroundColor = UIColor.blueColor()
        } else if finalPrice > 10 && finalPrice < 15 {
            mainView.backgroundColor = UIColor.greenColor()
        } else if finalPrice > 15 && finalPrice < 20 {
            mainView.backgroundColor = UIColor.redColor()
        } else if finalPrice > 20 {
            mainView.backgroundColor = UIColor.darkGrayColor()
        } else {
            mainView.backgroundColor = UIColor.whiteColor()
        }
        
    }
    
    
    
    
}

