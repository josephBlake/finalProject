//
//  SecondViewController.swift
//  finalProject
//
//  Created by ablake on 12/7/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    // This is the text that will display the answer
    @IBOutlet weak var calculatedText: UILabel!
    
    var myResultObjectTwo = ResultClass()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        calculatedText.text = myResultObjectTwo.resultPhrase
    }
}
