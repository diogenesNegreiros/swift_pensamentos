//
//  Configuration.swift
//  Swift_Pensamentos
//
//  Created by Diogenes de Souza on 28/05/21.
//

import Foundation

enum UserDefaultsKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case  autoRefresh = "autoRefresh"
}

class Configuration {
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get {
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool {
        get {
            return defaults.bool(forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
    }
    
    init() {
        
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(5.0, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        
    }
}
