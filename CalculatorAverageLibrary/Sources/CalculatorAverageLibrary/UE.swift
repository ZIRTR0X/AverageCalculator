//
//  File.swift
//  
//
//  Created by etudiant on 30/05/2023.
//

import Foundation

public struct UE : Identifiable, Equatable{
    
    public static func == (lhs: UE, rhs: UE) -> Bool {
        lhs.id == rhs.id
    }
    
    public let id: UUID;

    private var _name: String;
    public var name: String {
        get {_name;}
        set {_name = newValue;}
    }

    private var _average: Double;
    public var average: Double {
        get {_average;}
        set {_average = newValue;}
    }

    private var _coefficient: Int;
    public var coefficient: Int {
        get {_coefficient;}
        set {_coefficient = newValue;}
    }

    private var _state: StateAverage;
    public var state: StateAverage {
        get {_state;}
        set {_state = newValue;}
    }

    private var _subjects: [Subject];
    public var subjects: [Subject] {
        get {_subjects;}
        set {_subjects = newValue;}
    }

    private var _isProject: Bool;
    public var isProject: Bool {
        get {_isProject;}
        set {_isProject = newValue;}
    }

    public init(withName name: String, andAverage average: Double?, andCoefficent coefficient: Int, andSubjects subjects: [Subject], andState state: StateAverage, andIsProject isProject: Bool = false) {
        id = UUID();
        _name = name;
        _average = average ?? 0.0;
        _coefficient = coefficient;
        _subjects = subjects;
        _state = state;
        _isProject = isProject;
    }

    public mutating func addSubject(subject: Subject) {
        _subjects.append(subject);
    }

}
