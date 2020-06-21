//
//  FileManager.swift
//  
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public class JFileManager {
    
    static func getPlistFilePath(name: String) -> URL {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = URL(fileURLWithPath: path)
        let pathComponent = url.appendingPathComponent("\(name).plist")
        return pathComponent
    }
    
}

// MARK: - Write
extension JFileManager {
    
    public static func createFile(name: String, data: [String: Any], completion: @escaping (FileResult) -> Void) {
        if name.isEmpty || name.count == 0 {
            completion(FileResult.error)
            return
        }
        
        let fileManager = FileManager.default
        let pathComponent = JFileManager.getPlistFilePath(name: name)
        let filePath = pathComponent.path
        
        if fileManager.fileExists(atPath: filePath) {
            completion(FileResult.fileExist)
            
        } else {
            let plistDictionary = NSDictionary(dictionary: data)
            if plistDictionary.write(to: pathComponent, atomically: true) {
                completion(FileResult.writeSuccess)
                
            } else {
                completion(FileResult.writeFailed)
                
            }
        }
    }
}

// MARK: - Read
extension JFileManager {
    
    public static func getFile(name: String) -> NSDictionary? {
        let pathComponent = JFileManager.getPlistFilePath(name: name)
        if let plistDictionary = NSMutableDictionary(contentsOf: pathComponent) {
            return plistDictionary as NSDictionary
        } else {
            return nil
        }
    }
}

// MARK: - Update
extension JFileManager {
    
    public static func updateFile(name: String, data: [String: Any], completion: @escaping (FileResult) -> Void) {
        JFileManager.removeFile(name: name) { (result) in
            switch result {
            case .deleteSuccess:
                JFileManager.createFile(name: name, data: data, completion: { (result) in
                    switch result {
                    case .writeSuccess:
                        completion(FileResult.updateSuccess)
                        break
                        
                    default:
                        completion(FileResult.updateFailed)
                        break
                    }
                })
                break
                
            default:
                completion(FileResult.updateFailed)
                break
            }
        }
    }
}

// MARK: - Delete
extension JFileManager {
    
    public static func removeFile(name: String, completion: @escaping (FileResult) -> Void) {
        
        let fileManager = FileManager.default
        let filePath = JFileManager.getPlistFilePath(name: name).path
        
        do {
            try fileManager.removeItem(atPath: filePath)
            completion(FileResult.deleteSuccess)
            
        } catch let error {
            print("Error delete file", error.localizedDescription)
            completion(FileResult.deleteSuccess)
        }
    }
}
