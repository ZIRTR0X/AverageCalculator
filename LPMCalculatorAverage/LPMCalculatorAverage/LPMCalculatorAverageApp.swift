//
//  LPMCalculatorAverageApp.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 23/05/2023.
//

import SwiftUI
import CalculatorAverageLibrary
import CalculatorAverageVM
import Stub

@main
struct LPMCalculatorAverageApp: App {
    /*@StateObject
    var ueList: [UE] = [
        UE(withId: 1, andName: "UE1 Génie Logiciel", andAverage: 13.3, andCoefficent: 6, andSubjects: [
            Subject(withId: 1, andName: "UE1 Processus de développement ", andAverage: 10, andCoefficent: 4, andState: StateAverage.Preview),
            Subject(withId: 2, andName: "UE1 Programmation Objets", andAverage: 15, andCoefficent: 9, andState: StateAverage.Preview),
            Subject(withId: 3, andName: "UE1 Qualité de développpement", andAverage: 12, andCoefficent: 5, andState: StateAverage.Preview),
            Subject(withId: 4, andName: "UE1 Remise à niveau objets", andAverage: 14, andCoefficent: 4, andState: StateAverage.Preview)
        ])
    ]*/
    
    var managerVM : ManagerVM = ManagerVM(withUEs: StubData().ueVMs)

    var body: some Scene {
        WindowGroup {
            home(manager: managerVM)
        }
    }
}
