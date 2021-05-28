//
//  SettingsViewController.swift
//  Swift_Pensamentos
//
//  Created by Diogenes de Souza on 27/05/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var switchAutoRefresh: UISwitch!
    @IBOutlet weak var sliderTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var labelTimeInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    @IBAction func changeTimeInterval(_ sender: UISlider) {
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
    }
}
