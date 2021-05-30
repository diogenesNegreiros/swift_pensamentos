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
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView() {
        switchAutoRefresh.setOn(config.autoRefresh, animated: false)
        sliderTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double) {
        labelTimeInterval.text = "Mudar após \(value) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(sender.value)
        changeTimeIntervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
