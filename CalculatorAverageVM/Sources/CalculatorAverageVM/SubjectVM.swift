//
//  File.swift
//  
//
//  Created by etudiant on 07/06/2023.
//

import Foundation
import CalculatorAverageLibrary

public class SubjectVM : ObservableObject, Identifiable, Equatable {
    public static func ==(lhs: SubjectVM, rhs: SubjectVM) -> Bool {
        lhs.id == rhs.id
    }

    public init(withSubject subject: Subject) {
        self.model = subject;
    }

    @Published
    var model: Subject = Subject(withName: "", andAverage: 0, andCoefficent: 0, andIsLocked: true) {
        didSet {
            if model.name != name {
                name = model.name
            }
            if model.average != average {
                average = model.average
            }
            if model.coefficient != coefficient {
                coefficient = model.coefficient
            }
            if model.isLocked != isLocked {
                isLocked = model.isLocked
            }
        }
    }

    @Published
    public var name: String = "" {
        didSet {
            if model.name != name {
                model.name = name
            }
        }
    }

    @Published
    public var average: Int = 0 {
        didSet {
            if model.average != average {
                model.average = average
            }
        }
    }

    @Published
    public var coefficient: Int = 0 {
        didSet {
            if model.coefficient != coefficient {
                model.coefficient = coefficient
            }
        }
    }

    @Published
    public var isLocked: Bool = true {
        didSet {
            if model.isLocked != isLocked {
                model.isLocked = isLocked
            }
        }
    }
}
