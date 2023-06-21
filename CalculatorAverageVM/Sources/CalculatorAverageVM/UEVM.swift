import Foundation
import CalculatorAverageLibrary

public class UEVM : ObservableObject, Identifiable , Equatable{
    public static func ==(lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id
    }

    public init(withModel model: UE){
        self.model = model
    }
    
    @Published public var model: UE = UE(withName: "", andAverage: 0, andCoefficent: 0, andSubjects: [], andState: StateAverage.Preview) {
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
            if model.state != state {
                state = model.state
            }

            if !model.subjects.compare(to: subjects.map({$0.model})){
                subjects = model.subjects.map({SubjectVM(withSubject: $0)})
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
    public var average: Double = 0 {
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
    public var state: StateAverage = StateAverage.Preview {
        didSet {
            if model.state != state {
                model.state = state
            }
        }
    }

    /*@Published
    var subjects: [SubjectVM] = [] {
        didSet {
            let someModelSubjects = self.subjects.map({$0.model})
            if !self.model.subjects.compare(to: someModelSubjects){
                self.model.subjects = someModelSubjects
            }
        }
    }*/

    @Published
    public var subjects: [SubjectVM] = [] {
        didSet {
            let someModelSubjects: [Subject] = subjects.map({$0.model})
            if !model.subjects.compare(to: someModelSubjects){
                model.subjects = subjects.map({$0.model})
            }
        }
    }

    /*@Published
    var matieres: [MatiereVm] = [] {
        didSet{
            if (self.model.matieres.count != self.matieres.count){
                var data: [Matiere] = []
                for i in self.matieres{
                    data.append(Matiere(desc: i.desc, Name: i.name, Coeff: i.coeff, Moyenne: i.moyenne))
                }
                self.model.matieres = data
            }
        }
    }*/


}


/*let someModelNounours = self.someNounoursVM.map({$0.model})
if !self.model.someNounours.compare(to: someModelNounours){
    self.model.someNounours = someNounoursVM.map({$0.model})
}*/


//    @Published
//    var subjects: [SubjectVM] = [] {
//        didSet {
//            /*            if self.model.subjects.count != self.subjects.count ||
//             !self.model.subjects.allSatisfy({subject in
//             self.subjects.contains(sVM in sVM.model.id == subject.id)
//             }) {
//             self.model.subjects = self.subjects.map({$0.model})
//             }
//             self.model.subjects = self.subjects.map({$0.model})*/
//        }
//    }


        /*didSet {
            if self.model.someNounours.count != self.someNounours.count ||
            !self.model.someNounours.allSatisfy({nounours in
            self.someNounours.contains(nVM in nVM.model.id == nounours.id)
            }) {
                self.model.someNounours = self.someNounours.map({$0.model})
            }
            self.model.someNounours = self.someNounours.map({$0.id})
        }*/

