//
//  SinglePickerViewController.swift
//  tabdemo
//
//  Created by Jace Mattson on 2019-02-25.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class SinglePickerViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    var pickerData: [String] = [String]()
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerLabel: UILabel!
    @IBAction func pickerDate(_ sender: Any)
    {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        let selectedDay = pickerData[selectedRow]
        pickerLabel.text = "You selected \(selectedDay)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //connect data
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        //input data into arra
        pickerData = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
