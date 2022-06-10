//
//  NetworkMonitor.swift
//  
//
//  Created by James Layton on 6/25/20.
//

import Foundation
import Network

public class NetworkMonitor {
    
    public static func isConnected(networkOption: NetworkOptions, completion: @escaping (Bool)->()) {
        
        var monitor: NWPathMonitor
        
        switch networkOption {
        case .cell:
            monitor = NWPathMonitor(requiredInterfaceType: .cellular)
            break
            
        case .wifi:
            monitor = NWPathMonitor(requiredInterfaceType: .wifi)
            break
        }

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}
