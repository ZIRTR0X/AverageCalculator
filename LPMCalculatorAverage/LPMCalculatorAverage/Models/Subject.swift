//
// Created by etudiant on 25/05/2023.
//

import Foundation

public struct Subject {
    private var _id: Int;
    public var id: Int {
        get {_id;}
        set {_id = newValue;}
    }

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

    private var _state: StateAverage;
    public var state: StateAverage {
        get {_state;}
        set {_state = newValue;}
    }

    private var _grades: Grade[];
    
    init(withId id: Int, andName name: String, andAverage average: Int, andCoefficent coefficient: Int, andState state: StateAverage, andGrade grades: Grade[] ) {
        _id = id;
        _name = name;
        _average = average;
        _coefficient = coefficient;
        _state = state;
        _grades = grades;
    }
}
