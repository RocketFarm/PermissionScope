//
//  Structs.swift
//  PermissionScope
//
//  Created by Nick O'Neill on 8/21/15.
//  Copyright © 2015 That Thing in Swift. All rights reserved.
//

import Foundation

/// Permissions currently supportes by PermissionScope
@objc public enum PermissionType: Int, CustomStringConvertible {
    case LocationAlways, LocationInUse, Notifications, Microphone, Motion
    
    public var prettyDescription: String {
        switch self {
        case .LocationAlways, .LocationInUse:
            return "Location"
        default:
            return "\(self)"
        }
    }
    
    public var description: String {
        switch self {
        case .LocationAlways:   return "LocationAlways"
        case .LocationInUse:    return "LocationInUse"
        case .Notifications:    return "Notifications"
        case .Microphone:       return "Microphone"
        case .Motion:           return "Motion"
        }
    }
    
    static let allValues = [LocationAlways, LocationInUse, Notifications, Microphone, Motion]
}

/// Possible statuses for a permission.
@objc public enum PermissionStatus: Int, CustomStringConvertible {
    case Authorized, Unauthorized, Unknown, Disabled
    
    public var description: String {
        switch self {
        case .Authorized:   return "Authorized"
        case .Unauthorized: return "Unauthorized"
        case .Unknown:      return "Unknown"
        case .Disabled:     return "Disabled" // System-level
        }
    }
}

/// Result for a permission status request.
@objc public class PermissionResult: NSObject {
    public let type: PermissionType
    public let status: PermissionStatus
    
    internal init(type:PermissionType, status:PermissionStatus) {
        self.type   = type
        self.status = status
    }
    
    override public var description: String {
        return "\(type) \(status)"
    }
}
