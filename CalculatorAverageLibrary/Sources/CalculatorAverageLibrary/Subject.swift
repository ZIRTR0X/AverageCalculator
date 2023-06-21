//
//  File.swift
//
//
//  Created by etudiant on 30/05/2023.
//

import Foundation

public struct Subject: Identifiable, Equatable{
    public static func ==(lhs: Subject, rhs: Subject) -> Bool {
        lhs.id == rhs.id
    }

    public let id: UUID;

    private var _name: String;
    public var name: String {
        get {_name;}
        set {_name = newValue;}
    }

    private var _average: Int;
    public var average: Int {
        get {_average;}
        set {_average = newValue;}
    }

    private var _coefficient: Int;
    public var coefficient: Int {
        get {_coefficient;}
        set {_coefficient = newValue;}
    }

    private var _isLocked: Bool;
    public var isLocked: Bool {
        get {_isLocked;}
        set {_isLocked = newValue;}
    }
    
    public init(withName name: String, andAverage average: Int, andCoefficent coefficient: Int, andIsLocked isLocked: Bool ) {
        id = UUID();
        _name = name;
        _average = average;
        _coefficient = coefficient;
        _isLocked = isLocked;
    }
}
