import Foundation
import CalculatorAverageLibrary
import CalculatorAverageVM

public struct StubData {
    
    
    public let ueVMs: [UEVM];

    private let ues: [UE] = [
        UE(withName: "UE 1 : Génie Logiciel", andAverage: 10, andCoefficent: 6, andSubjects: [
        ], andState: StateAverage.Preview),
        UE(withName: "UE 2 : Systèmes et réseaux", andAverage: 9, andCoefficent: 6, andSubjects: [], andState: StateAverage.Preview),
        UE(withName: "UE 3 : Insertion Professionnelle", andAverage: 11, andCoefficent: 6, andSubjects: [], andState: StateAverage.Preview),
        UE(withName: "UE 4 : Technologies Mobiles 1", andAverage: 20, andCoefficent: 9, andSubjects: [], andState: StateAverage.Preview),
        UE(withName: "UE 5 : Technologies Mobiles 2", andAverage: 0, andCoefficent: 9, andSubjects: [], andState: StateAverage.Preview),
        UE(withName: "UE 6 : Projet", andAverage: 0.1, andCoefficent: 9, andSubjects: [], andState: StateAverage.Preview),
        UE(withName: "UE 7 : Stage", andAverage: 0, andCoefficent: 15, andSubjects: [], andState: StateAverage.Preview)
    ]
    private var subjectsVM: [[SubjectVM]] = [[],[],[],[],[],[],[]]
    private let subjects: [[Subject]] = [
        [
            Subject(withName: "Processus de développement", andAverage: 10, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "Programmation Objets", andAverage: 0, andCoefficent: 9, andIsLocked: false),
            Subject(withName: "Qualité de développpement", andAverage: 0, andCoefficent: 5, andIsLocked: false),
            Subject(withName: "Remise à niveau objets", andAverage: 0, andCoefficent: 4, andIsLocked: false)
        ],
        [
            Subject(withName: "Internet des Objets", andAverage: 0, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "Réseaux", andAverage: 0, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "Services Mobiles", andAverage: 0, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "Système", andAverage: 0, andCoefficent: 5, andIsLocked: false)
        ],
        [
            Subject(withName: "Anglais", andAverage: 0, andCoefficent: 5, andIsLocked: false),
            Subject(withName: "Economie", andAverage: 0, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "Gestion", andAverage: 0, andCoefficent: 3, andIsLocked: false),
            Subject(withName: "Communication", andAverage: 0, andCoefficent: 4, andIsLocked: false)
        ],
        [
            Subject(withName: "Android", andAverage: 0, andCoefficent: 6, andIsLocked: false),
            Subject(withName: "Architecture de projets C# .NET (1)", andAverage: 0, andCoefficent: 5, andIsLocked: false),
            Subject(withName: "C++", andAverage: 0, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "Swift", andAverage: 0, andCoefficent: 5, andIsLocked: false)
        ],
        [
            Subject(withName: "Architecture de projets C# .NET (2)", andAverage: 0, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "Client/Serveur", andAverage: 0, andCoefficent: 4, andIsLocked: false),
            Subject(withName: "iOS", andAverage: 0, andCoefficent: 5, andIsLocked: false),
            Subject(withName: "Multiplateforme", andAverage: 0, andCoefficent: 4, andIsLocked: false)
        ],
        [
            Subject(withName: "Projet", andAverage: 0, andCoefficent: 9, andIsLocked: false)
        ],
        [
            Subject(withName: "Stage", andAverage: 0, andCoefficent: 15, andIsLocked: false)
        ]
    ]

    public init() {
        self.ueVMs = [
            UEVM(withModel: ues[0]),
            UEVM(withModel: ues[1]),
            UEVM(withModel: ues[2]),
            UEVM(withModel: ues[3]),
            UEVM(withModel: ues[4]),
            UEVM(withModel: ues[5]),
            UEVM(withModel: ues[6])
        ]

        for i in 0..<subjects.count {
            for j in 0..<subjects[i].count {
                subjectsVM[i].append(SubjectVM(withSubject: self.subjects[i][j]))
            }
        }

        for i in 0..<ueVMs.count {
            ueVMs[i].subjects = subjectsVM[i]
        }
    }

//    public func getUEVMs() -> [UEVM] {
//        return ueVMs
//    }
}
