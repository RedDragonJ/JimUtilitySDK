//
//  NetworkMonitor.swift
//
//
//  Created by James Layton on 6/25/20.
//

import Foundation
import Network

public class NetworkMonitor {

    public static func isConnected(networkOption: NetworkOptions) async -> Bool {
        await withCheckedContinuation { continuation in
            let monitor: NWPathMonitor

            switch networkOption {
            case .cell:
                monitor = NWPathMonitor(requiredInterfaceType: .cellular)
            case .wifi:
                monitor = NWPathMonitor(requiredInterfaceType: .wifi)
            }

            monitor.pathUpdateHandler = { path in
                monitor.cancel()
                continuation.resume(returning: path.status == .satisfied)
            }

            monitor.start(queue: DispatchQueue(label: "Monitor"))
        }
    }
}
