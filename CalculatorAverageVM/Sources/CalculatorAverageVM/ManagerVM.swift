//
//  File.swift
//  
//
//  Created by etudiant on 14/06/2023.
//
import CalculatorAverageLibrary
import Foundation

public class ManagerVM: ObservableObject {
    @Published
    public var ueVMs: [UEVM] = []

    public init(withUEs ues: [UE]) {
        self.ueVMs = ues.map({UEVM(withModel: $0)})
    }

    public init(withUEs ues: [UEVM]) {
        self.ueVMs = ues
    }
}
