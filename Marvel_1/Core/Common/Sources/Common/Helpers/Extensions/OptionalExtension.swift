//  OptionalExtension.swift
//  Marvel
//
//  Created by Jessica Serqueira on 12/12/2022.
//


import Foundation

public protocol Defaultable {
    static var defaultValue: Self { get }
}

extension Optional where Wrapped: Defaultable {
    public var unwrappedValue: Wrapped { return self ?? Wrapped.defaultValue }
}

extension String: Defaultable {
    public static var defaultValue: String {
        ""
    }
}

extension Int: Defaultable {
    public static var defaultValue: Int {
        return 0
    }
}

extension Double: Defaultable {
    public static var defaultValue: Double {
        return 0.0
    }
}

extension Dictionary: Defaultable {
    public static var defaultValue: Dictionary<Key, Value> {
        return [:]
    }
}

extension Array: Defaultable {
    public static var defaultValue: Array {
        return []
    }
}

extension Bool: Defaultable {
    public static var defaultValue: Bool {
        return false
    }
}
