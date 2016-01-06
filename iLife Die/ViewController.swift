//
//  ViewController.swift
//  iLife Count
//
//  Created by Dominick Hera on 3/6/15.
//  Copyright (c) 2015 Posa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabelOne: UILabel!
    @IBOutlet weak var valueLabelTwo: UILabel!
    @IBOutlet weak var stepperTwo: UIStepper!
    @IBOutlet weak var stepperOne: UIStepper!
    @IBOutlet weak var valueLabelTwoforOne: UILabel!
    @IBOutlet weak var valueLabelOneforTwo: UILabel!
    @IBOutlet weak var enemyLabelOne: UILabel!
    @IBOutlet weak var healthLabelOne: UILabel!
    @IBOutlet weak var resetButton: UIButton!
   // @IBOutlet weak var bottomTimerLabel: UILabel!
  //  @IBOutlet weak var topTimerLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
 
    
    let kWarningTitle = "Reset Score"
    let kInfoTitle = "Information"
    let kSubtitle = "Are you sure you want to reset the scores?"
    let ksubtitle2 = "Hi, my name's Dominick and I'm just some guy on his MacBook Pro coding away to the best of his abilties. I would link social media but I have none. I hope you enjoy the application. Feel free to email me at dominickhera@me.com or visit my website at dominickhera.com"
    let kDefaultAnimationDuration = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // updateTime()
       // var timer = NSTimer()
        //let aSelector : Selector = "updateTime"
        //timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        
        stepperOne.value = 20
        stepperTwo.value = 20
        stepperOne.wraps = true
        stepperTwo.wraps = true
        stepperOne.autorepeat = true
        stepperTwo.autorepeat = true
        stepperOne.maximumValue = 999999
        stepperTwo.maximumValue = 999999
        
        stepperTwo.transform=CGAffineTransformMakeScale(1.75, 1.75)
        stepperTwo.transform=CGAffineTransformRotate(stepperOne.transform,100000.035)
        valueLabelOne.transform=CGAffineTransformRotate(valueLabelOne.transform,100000.035)
        valueLabelTwoforOne.transform=CGAffineTransformRotate(valueLabelTwoforOne.transform,100000.035)
        enemyLabelOne.transform=CGAffineTransformRotate(enemyLabelOne.transform,100000.035)
        healthLabelOne.transform=CGAffineTransformRotate(healthLabelOne.transform,100000.035)
        resetButton.transform=CGAffineTransformRotate(resetButton.transform, 50000.0175 )
       // topTimerLabel.transform=CGAffineTransformRotate(topTimerLabel.transform, 100000.035)
        
    }
    @IBAction func stepperOneAction(sender: UIStepper) {
        valueLabelOne.text = Int(sender.value).description
        valueLabelOneforTwo.text = Int(sender.value).description
    }
    @IBAction func stepperTwoAction(sender: UIStepper) {
    valueLabelTwo.text = Int(sender.value).description
        valueLabelTwoforOne.text = Int(sender.value).description
    }
    @IBAction func resetButtonTapped(sender: UIButton) {
        let alert = SCLAlertView()
        alert.addButton("Reset to 20") {
        self.stepperOne.value = 20
        self.stepperTwo.value = 20
        self.valueLabelOne.text = "20"
        self.valueLabelTwo.text = "20"
        self.valueLabelOneforTwo.text = "20"
        self.valueLabelTwoforOne.text = "20"
        }
        alert.addButton("Reset to 30") {
            self.stepperTwo.value = 30
            self.stepperOne.value = 30
            self.valueLabelOne.text = "30"
            self.valueLabelTwo.text = "30"
            self.valueLabelOneforTwo.text = "30"
            self.valueLabelTwoforOne.text = "30"
        }
        alert.addButton("Reset to 40"){
        self.stepperTwo.value = 40
        self.stepperOne.value = 40
        self.valueLabelOne.text = "40"
        self.valueLabelTwo.text = "40"
        self.valueLabelOneforTwo.text = "40"
        self.valueLabelTwoforOne.text = "40"
    }
        alert.showWarning(kWarningTitle, subTitle: kSubtitle)
    }
    @IBAction func infoButtonAction(sender: UIButton) {
        let alert = SCLAlertView()
        alert.showInfo(kInfoTitle, subTitle: ksubtitle2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
  /*  func updateTime() {
        var date = NSDate()
        var calendar = NSCalendar.currentCalendar()
        var components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        var hour = components.hour
        var minutes = components.minute
        var seconds = components.second
        bottomTimerLabel.text = "\(hour):\(minutes):\(seconds)"
        topTimerLabel.text = "\(hour):\(minutes):\(seconds)"
        
    }*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "showSettings" {
            
            let controller = segue.destinationViewController as SettingsViewController
            //let row = tableView.indexPathForSelectedRow()!.row
           // println("row: \(row)")
           // let loan = iOU_4_0[row] as NSManagedObject
            //println(loan)
            //controller.loanPersonPass = iOU_4_0[row] as? NSManagedObject
        }
    }
}

