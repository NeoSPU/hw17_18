//
//  ViewController.swift
//  HW17
//
//  Created by Alex Neo on 25.11.2017.
//  Copyright © 2017 Alex Neo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var nextButton: UIButton!
    var changeColorAction: ((UIColor) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColorAction = {
            (screenColor: UIColor) in
            self.view.backgroundColor = screenColor
            self.nextButton.backgroundColor = screenColor
        }
    }
    
    @IBAction func redButtonPressed(_ sender: Any) {
        changeColorAction?(.red)
    }
    @IBAction func greenButtonPressed(_ sender: Any) {
        changeColorAction?(.green)
    }
    @IBAction func blueButtonPressed(_ sender: Any) {
        changeColorAction?(.blue)
    }
}
