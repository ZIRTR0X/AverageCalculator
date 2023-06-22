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

    public convenience init(withUEs ues: [UE]) {
        self.init(withUEs: ues.map { UEVM(withModel: $0) })
    }

    public init(withUEs ues: [UEVM]) {
        ueVMs = ues

        ueVMs.forEach { uevm in
            uevm.managerVM = self
        }
    }
    
    func update(from ue: UEVM){
        self.objectWillChange.send()
    }
}
