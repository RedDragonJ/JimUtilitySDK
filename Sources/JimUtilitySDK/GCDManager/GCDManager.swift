//
//  GCDManager.swift
//  
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public class GCDManager {
    
    /** Delay process by certain times **/
    public static func delayTask(time: Double, process: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            process()
        }
    }
    
    /** Run the method in background thread **/
    public static func runTaskInBackground(process: @escaping ()->()) {
        DispatchQueue.global(qos: .background).async {
            process()
        }
    }
    
    /** Run the method in the main thread **/
    public static func runTaskInMain(process: @escaping ()->()) {
        DispatchQueue.main.async {
            process()
        }
    }
}
