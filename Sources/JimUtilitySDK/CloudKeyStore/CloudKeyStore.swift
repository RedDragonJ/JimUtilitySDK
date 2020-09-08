//
//  CloudKeyStore.swift
//  
//
//  Created by James Layton on 9/8/20.
//

import Foundation

public class CloudKeyStore {
    
    public var prefix: String
    public init(){
        self.prefix = String()
    }
    
    /**
     
     IMPORTANT: Please enable the iCloud capability to use this method
     
     Set this method in didFinishLaunchingWithOptions
     Then use userDefault to save user setting related data and
     all other information will be synced to iCloud.
     
     */
    public func startWith(prefix: String) {
        self.prefix = prefix
        
        if isICloudAvailable() {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(loadICloud(notification:)),
                                                   name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
                                                   object: nil)
                
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(updateICloud(notification:)),
                                                   name: UserDefaults.didChangeNotification,
                                                   object: nil)
        } else {
            Logger.log("WARNING: ICloud not enabled")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UserDefaults.didChangeNotification,
                                                  object: nil)
    }
        
    @objc func updateICloud(notification: Notification) {
        let dict = UserDefaults.standard.dictionaryRepresentation()
        for (key, value) in dict {
            if key.hasPrefix(prefix) {
                NSUbiquitousKeyValueStore.default.set(value, forKey: key)
            }
        }
        NSUbiquitousKeyValueStore.default.synchronize()
    }
    
    @objc func loadICloud(notification: Notification) {
        let iCloudStore = NSUbiquitousKeyValueStore.default
        let dict = iCloudStore.dictionaryRepresentation
        
        // prevent NSUserDefaultsDidChangeNotification from being posted while we update from iCloud
        NotificationCenter.default.removeObserver(self,
                                                  name: UserDefaults.didChangeNotification,
                                                  object: nil)
        
        for (key, value) in dict {
            if key.hasPrefix(prefix) {
                UserDefaults.standard.set(value, forKey: key)
            }
        }
        UserDefaults.standard.synchronize()
        
        // enable NSUserDefaultsDidChangeNotification notifications again
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateICloud(notification:)),
                                               name: UserDefaults.didChangeNotification,
                                               object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "iCloudSyncDidUpdateToLatest"),
                                        object: nil)
    }
    
    func isICloudAvailable() -> Bool {
        return (FileManager.default.ubiquityIdentityToken != nil)
    }
}
