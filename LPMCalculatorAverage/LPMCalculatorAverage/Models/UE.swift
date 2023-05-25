//
// Created by etudiant on 23/05/2023.
//

import Foundation

public struct UE {
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

    /*private var _subjects: S

    public func addSubject(){
    }

    public func getSubjects() -> Subject[] {

    }*/
}
