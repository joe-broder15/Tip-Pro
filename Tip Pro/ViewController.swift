//
//  ViewController.swift
//  Tip Pro
//
//  Created by Admin on 6/22/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //UI elements
    @IBOutlet weak var billAmountFeild: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountFeild: UITextField!
    @IBOutlet weak var totalAmountFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return.LightContent
    }

    //when the calculate button is pressed
    @IBAction func calculateTip(sender: AnyObject) {
    
        //Tip calculation goes here
        
        //If text feilds are not numbers, make them blank
        guard let billAmount = Double(billAmountFeild.text!) else{
            billAmountFeild.text = ""
            tipAmountFeild.text = ""
            totalAmountFeild.text = ""
            return
        }
        
        //Sets the tip percentage based on the segment chosen
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex{
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.2
        default:
            break
        }
        
        let roundedBillAmount = round(billAmount*100)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(tipAmount*100)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountFeild.editing){
                billAmountFeild.text = String(format: "%.2f", roundedBillAmount )
        }
        
        tipAmountFeild.text = String(format: "%.2f", roundedTipAmount)
        totalAmountFeild.text = String(format: "%.2f", totalAmount)
        
    }
    

}

