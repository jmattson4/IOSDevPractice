//
//  ViewController.swift
//  Quiz02
//
//  Created by Jace Mattson on 2019-02-01.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var display: UILabel!
    @IBAction func addTen(_ sender: UIButton)
    {
        var textField = (Double)(numberTextField.text!)
        
        textField = textField! + 10;
        
        display.text = "\(textField!)"
        
    }
    
}

