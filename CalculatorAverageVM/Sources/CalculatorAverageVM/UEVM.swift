import Foundation
import CalculatorAverageLibrary

public class UEVM : ObservableObject, Identifiable , Equatable{
    public static func ==(lhs: UEVM, rhs: UEVM) -> Bool {
        lhs.id == rhs.id
    }

    public init(withModel model: UE){
        self.model = model
    }
    
    var managerVM: ManagerVM?
    
    @Published public var model: UE = UE(withName: "", andAverage: 0, andCoefficent: 0, andSubjects: [], andState: StateAverage.Preview, andIsProject: false) {
        didSet {
            if model.name != name {
                name = model.name
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

            if model.isProject != isProject {
                isProject = model.isProject
            }

            self.subjects.forEach { svm in
                if svm.ue == nil {
                    svm.ue = self
                }
            }
            calculateNote()
            self.notifyChanged()
        }
    }
    
    @Published
    public var name: String = "" {
        didSet {
            if model.name != name {
                model.name = name
            }
            self.notifyChanged()
        }
    }
    
    @Published
    public var average: Double = 0 {
        didSet {
            if model.average != average {
                model.average = average
            }
            self.notifyChanged()
        }
    }
    
    @Published
    public var coefficient: Int = 0 {
        didSet {
            if model.coefficient != coefficient {
                model.coefficient = coefficient
            }
            self.notifyChanged()
        }
    }
    
    @Published
    public var state: StateAverage = StateAverage.Preview {
        didSet {
            if model.state != state {
                model.state = state
            }
            self.notifyChanged()
        }
    }

    @Published
    public var subjects: [SubjectVM] = [] {
        didSet {
            let someModelSubjects: [Subject] = subjects.map({$0.model})
            if !model.subjects.compare(to: someModelSubjects){
                model.subjects = subjects.map({$0.model})
            }
            self.notifyChanged()
        }
    }

    @Published
    public var isProject: Bool = false {
        didSet {
            if model.isProject != isProject {
                model.isProject = isProject
            }
            self.notifyChanged()
        }
    }

    func calculateNote() {
        if(subjects.count == 0){
            average = 0
            return
        }
        let coefficientTotal: Double = subjects.reduce(0.0) { result, subject in
            result + Double(subject.coefficient)
        }

        let notetotal: Double = subjects.reduce(0.0) { result, subject in
            let note: Double = Double(subject.average) * Double(subject.coefficient)
            return result + note
        }

        average = notetotal / coefficientTotal
    }

    func update(from subjectVM: SubjectVM){
        if let index = self.model.subjects.firstIndex(of: subjectVM.model){
            self.model.subjects[index] = subjectVM.model
        }
        calculateNote()
        self.objectWillChange.send()
    }
    
    func notifyChanged(){
        managerVM?.update(from: self)
    }
}
