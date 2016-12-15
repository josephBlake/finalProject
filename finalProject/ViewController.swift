//
//  ViewController.swift
//  finalProject
//
//  Created by ablake on 12/5/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // These are all the variables from the first viewcontroller
    @IBOutlet weak var hourTime: UITextField!
    @IBOutlet weak var minuteTime: UITextField!
    @IBOutlet weak var secondTime: UITextField!
    @IBOutlet weak var mileDistance: UITextField!
    @IBOutlet weak var hourPace: UITextField!
    @IBOutlet weak var minutePace: UITextField!
    @IBOutlet weak var secondPace: UITextField!
    //This is the Class that will transfer the final answer's data from one viewcontroller to the other
    var myResultObject = ResultClass()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func notBlank(text: String) -> DarwinBoolean
    {
        // This is to check for any blanks in necessary textfields
        if(text == "")
        {
            return false
        }
        return true
    }
    
    func simpleConvertTime() -> Int
    {
        // This is supposed to convert hours and minutes and seconds into just seconds for math use
        var convertingHours = 0
        if(notBlank(text: hourTime.text!)).boolValue
        {
            convertingHours = Int(hourTime.text!)! * 60
        }
        else
        {
            convertingHours = 0 * 60
        }
        
        var convertingMinutes = 0
        if(notBlank(text: minuteTime.text!)).boolValue
        {
            convertingMinutes = (Int(minuteTime.text!)! + convertingHours) * 60
        }
        else
        {
            convertingMinutes = 0 + (convertingHours) * 60
        }
        
        var totalSeconds = 0
        if(notBlank(text: secondTime.text!)).boolValue
        {
            totalSeconds = (Int(secondTime.text!)! + convertingMinutes)
        }
        else
        {
            totalSeconds = 0 + (convertingMinutes)
        }
        return totalSeconds
    }
    
    func simpleConvertPace() -> Int
    {
        // This is supposed to convert hours and minutes and seconds into just seconds for math use
        var convertingHours = 0
        if(notBlank(text: hourPace.text!)).boolValue
        {
            convertingHours = Int(hourPace.text!)! * 60
        }
        else
        {
            convertingHours = 0 * 60
        }
        
        var convertingMinutes = 0
        if(notBlank(text: minutePace.text!)).boolValue
        {
            convertingMinutes = (Int(minutePace.text!)! + convertingHours) * 60
        }
        else
        {
            convertingMinutes = 0 + (convertingHours) * 60
        }
        
        var totalSeconds = 0
        if(notBlank(text: secondTime.text!)).boolValue
        {
            totalSeconds = (Int(secondTime.text!)! + convertingMinutes)
        }
        else
        {
            totalSeconds = 0 + (convertingMinutes)
        }
        return totalSeconds
    }
    
    func complexConvertTime(seconds: Int) -> (Int, Int, Int)
    {
        // This is supposed to convert seconds back into hours and minutes and seconds for use of display
        let convertedHours = seconds / 3600
        let convertedMinutes = (seconds % 3600) / 60
        let convertedSeconds = (seconds % 3600) % 60
        return (convertedHours, convertedMinutes, convertedSeconds)
    }
    
    func aTime(distance: Double, pace: Int) -> Int
    {
        // This is supposed to find time through the distance and pace variables
        let doublePace = Double(pace)
        let time = doublePace * distance
        return Int(time)
    }
    
    func aDistance(time: Int, pace: Int) -> Double
    {
        // This is supposed to find distance through the time and pace variables
        let temporaryPace = Double(pace)
        let temporaryTime = Double(time)
        let answer = (pow(temporaryPace,-1) * temporaryTime)
        return answer
    }
    
    func aPace(time: Int, distance: Double) -> Int
    {
        // This is supposed to find pace through the time and distance variables
        let doubleTime = Double(time)
        let pace = doubleTime/distance
        return Int(pace)
    }
    
    @IBAction func findTime(_ sender: Any)
    {
        // One the "Calculate Time" button is pressed, this will find the answer and put it into a String variable
        let simplePace = simpleConvertPace()
        let answer = aTime(distance: Double(mileDistance.text!)!, pace: simplePace)
        let answerTwo = complexConvertTime(seconds: answer)
        let answerString = "\(answerTwo.0) Hours:\(answerTwo.1) Minutes:\(answerTwo.2) Seconds"
        myResultObject.resultPhrase = answerString
    }
    
    @IBAction func findDistance(_ sender: Any)
    {
        // One the "Calculate Distance" button is pressed, this will find the answer and put it into a String variable
        let simpleTime = simpleConvertTime()
        let simplePace = simpleConvertPace()
        let answer = aDistance(time: simpleTime, pace: simplePace)
        let answerString = "\(answer) Miles"
        myResultObject.resultPhrase = answerString
    }
    
    @IBAction func findPace(_ sender: Any)
    {
        // One the "Calculate Pace" button is pressed, this will find the answer and put it into a String variable
        let simpleTime = simpleConvertTime()
        let answer = aPace(time: simpleTime, distance: Double(mileDistance.text!)!)
        let answerTwo = complexConvertTime(seconds: answer)
        let answerString = "\(answerTwo.0) Hours:\(answerTwo.1) Minutes:\(answerTwo.2) Seconds"
        myResultObject.resultPhrase = answerString
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // This will transfer the answer's data to the next storyboard to present to the user
        let storyVC = segue.destination as! SecondViewController
        storyVC.myResultObjectTwo = myResultObject
    }
}

