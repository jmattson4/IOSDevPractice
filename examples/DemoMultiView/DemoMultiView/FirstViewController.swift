//
//  FirstViewController.swift
//  DemoMultiView
//
//  Created by Jace Mattson on 2019-02-06.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var backgroundColor: UIColor = UIColor.black
    @IBAction func unwindToFirst(segue: UIStoryboardSegue  )
    {
        if let sourceViewController = segue.source as? SecondViewController
        {
            self.view.backgroundColor = UIColor(red: sourceViewController.redColorValue, green: sourceViewController.greenColorValue, blue: sourceViewController.blueColorValue, alpha: 1)
        }
    }
    
    var colorName: String = "white"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //switches the view to the other view when button pressed
        colorName = sender.title(for: .normal)!
        performSegue(withIdentifier: "FirstVCSegue", sender: self)
    }

    
    /*
    // MARK: - Navigation
     In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         //Get the new view controller using segue.destinationViewController.
        let secondVc = segue.destination as! SecondViewController
         //Pass the selected object to the new view controller.
        if colorName == "Gold"
        {
            secondVc.backgroundColor = UIColor.yellow
        }
        else if colorName == "Silver"
        {
            secondVc.backgroundColor = UIColor.gray
        }
        else if colorName == "Bronze"
        {
            secondVc.backgroundColor = UIColor.brown
        }
        
    }
 

}
