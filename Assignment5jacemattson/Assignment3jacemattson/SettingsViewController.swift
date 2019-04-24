//
//  SettingsViewController.swift
//  Assignment3jacemattson
//
//  Created by Jace Mattson on 2019-04-10.
//  Copyright © 2019 Jace Mattson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var darkThemeSwitch: UISwitch!
    
    
    @IBOutlet weak var slotLevelSlider: UISlider!
    
    func loadUserSettings(){
        let defaults = UserDefaults.standard
        nameTextField.text = defaults.string(forKey: "gamblersName")
        darkThemeSwitch.isOn = defaults.bool(forKey: "darkTheme")
        slotLevelSlider.value = defaults.object(forKey: "slotLevel") as! Float
    }
    @IBAction func changeSettings(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(nameTextField.text, forKey: "gamblersName")
        defaults.set(darkThemeSwitch.isOn, forKey: "darkTheme")
        defaults.set(slotLevelSlider.value, forKey: "slotLevel")
        defaults.synchronize()
    }
    @objc func applicationWillEnterForeground(notifaction:NSNotification){
        let defaults = UserDefaults.standard
        loadUserSettings()
        defaults.synchronize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserSettings()
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notifaction:)), name: Notification.Name.UIApplicationWillEnterForeground, object: app)
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserSettings()        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        
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
