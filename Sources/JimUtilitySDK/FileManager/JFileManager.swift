//
//  FileManager.swift
//
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public class JFileManager {

    public static func getPlistFilePath(name: String) -> URL {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = URL(fileURLWithPath: path)
        return url.appendingPathComponent("\(name).plist")
    }
}

// MARK: - Write
public extension JFileManager {

    static func createFile(name: String, data: [String: Any]) -> FileResult {
        guard !name.isEmpty else { return .error }

        let fileManager = FileManager.default
        let pathComponent = JFileManager.getPlistFilePath(name: name)

        if fileManager.fileExists(atPath: pathComponent.path) {
            return .fileExist
        }

        let plistDictionary = NSDictionary(dictionary: data)
        return plistDictionary.write(to: pathComponent, atomically: true) ? .writeSuccess : .writeFailed
    }

    @available(*, deprecated, message: "Use createFile(name:data:) which returns FileResult directly.")
    static func createFile(name: String, data: [String: Any], completion: @escaping (FileResult) -> Void) {
        completion(createFile(name: name, data: data))
    }
}

// MARK: - Read
public extension JFileManager {

    static func getFile(name: String) -> NSDictionary? {
        let pathComponent = JFileManager.getPlistFilePath(name: name)
        return NSMutableDictionary(contentsOf: pathComponent)
    }
}

// MARK: - Update
public extension JFileManager {

    static func updateFile(name: String, data: [String: Any]) -> FileResult {
        let deleteResult = removeFile(name: name)
        guard deleteResult == .deleteSuccess else { return .updateFailed }
        let createResult = createFile(name: name, data: data)
        return createResult == .writeSuccess ? .updateSuccess : .updateFailed
    }

    @available(*, deprecated, message: "Use updateFile(name:data:) which returns FileResult directly.")
    static func updateFile(name: String, data: [String: Any], completion: @escaping (FileResult) -> Void) {
        completion(updateFile(name: name, data: data))
    }
}

// MARK: - Delete
public extension JFileManager {

    static func removeFile(name: String) -> FileResult {
        let filePath = JFileManager.getPlistFilePath(name: name).path
        do {
            try FileManager.default.removeItem(atPath: filePath)
            return .deleteSuccess
        } catch {
            print("Error delete file", error.localizedDescription)
            return .deleteFailed
        }
    }

    @available(*, deprecated, message: "Use removeFile(name:) which returns FileResult directly.")
    static func removeFile(name: String, completion: @escaping (FileResult) -> Void) {
        completion(removeFile(name: name))
    }
}
