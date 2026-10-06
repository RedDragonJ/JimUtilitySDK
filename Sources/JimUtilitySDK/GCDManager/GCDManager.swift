//
//  GCDManager.swift
//
//
//  Created by James Layton on 6/21/20.
//

import Foundation

public class GCDManager {

    @available(*, deprecated, message: "Use Task { try? await Task.sleep(for: .seconds(time)) } instead.")
    public static func delayTask(time: Double, process: @escaping () -> Void) {}

    @available(*, deprecated, message: "Use Task { } or Task.detached { } instead.")
    public static func runTaskInBackground(process: @escaping () -> Void) {}

    @available(*, deprecated, message: "Use await MainActor.run { } or mark your function @MainActor instead.")
    public static func runTaskInMain(process: @escaping () -> Void) {}
}
