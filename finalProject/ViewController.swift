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

    @IBOutlet weak var hourTime: UITextField!
    @IBOutlet weak var minuteTime: UITextField!
    @IBOutlet weak var secondTime: UITextField!
    @IBOutlet weak var mileDistance: UITextField!
    @IBOutlet weak var hourPace: UITextField!
    @IBOutlet weak var minutePace: UITextField!
    @IBOutlet weak var secondPace: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func simpleConvertTime() -> Int
    {
        // This is supposed to convert hours and minutes and seconds into just seconds for use of math
        let convertingHours = Int(hourTime.text!)! * 60
        let convertingMinutes = (Int(minuteTime.text!)! + convertingHours) * 60
        let totalSeconds = Int(secondTime.text!)! + convertingMinutes
        return totalSeconds
    }
    
    func simpleConvertPace() -> Int
    {
        // This is supposed to convert hours and minutes and seconds into just seconds for use of math
        let convertingHours = Int(hourPace.text!)! * 60
        let convertingMinutes = (Int(minutePace.text!)! + convertingHours) * 60
        let totalSeconds = Int(secondPace.text!)! + convertingMinutes
        return totalSeconds
    }
    
    func complexConvertTime(seconds: Int) -> (Int, Int, Int)
    {
        // This is supposed to convert seconds back into hours and minutes and seconds for use of display
        let convertedHours = seconds % 3600
        let convertedMinutes = (convertedHours / 3600) % 60
        let convertedSeconds = convertedMinutes / 60
        return (convertedHours, convertedMinutes, convertedSeconds)
    }
    
    func aTime(distance: Int, pace: Int) -> Int
    {
        // This is supposed to multiply pace by distance to find time
        var temporaryPace = Double(pace)
        var temporaryDistance = Double(distance)
        var answer = (pow(temporaryPace,-1) * temporaryDistance)
        var answerTwo = Int(answer)
        return answerTwo
    }
    
    func aDistance(time: Int, pace: Int) -> Int
    {
        // This is supposed to multiply pace by time to find distance
        var distance = pace * time
        return distance
    }
    
    func aPace(time: Int, distance: Int) -> Int
    {
        // This is supposed to divide time by distance to find pace
        let pace = distance/time
        return pace
    }
    
    @IBAction func findTime(_ sender: Any)
    {
        
    }
    
    @IBAction func findDistance(_ sender: Any)
    {
        
    }
    
    @IBAction func findPace(_ sender: Any)
    {
        
    }
    
}

