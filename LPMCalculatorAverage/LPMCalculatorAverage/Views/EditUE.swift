//
// Created by etudiant on 23/06/2023.
//

import SwiftUI
import CalculatorAverageVM
import Stub

struct EditUE: View {
    @StateObject
    var ue: UEVM
    @ObservedObject
    var ueEditedCopy: UEVM

    var body : some View {

        var isEdit : Bool = onEditing()
        var subjects : [SubjectVM] = ue.subjects
        var subjectEditedCopy : [SubjectVM] = ue.subjects.map({$0.editedCopy!})

       NavigationStack {
           ScrollView {
               VStack {
                   HStack {
                       Text("Nom")
                       TextField("Nom", text: $ueEditedCopy.name)
                       Spacer()
                   }
                   HStack {
                       Text("Coefficient")
                       TextField("Coefficient", value: $ueEditedCopy.coefficient, formatter: NumberFormatter())
                       Spacer()
                   }
               }
                       .padding()
                       .background(Color("LigthGrey"))
                       .cornerRadius(5)
                       .frame(width: 300, height: 100)
               Divider()
                       .padding()
               VStack {
                   ForEach(subjects) { subject in
                       EditSubject(subject: subject, subjectEditedCopy: subjectEditedCopy[subjects.firstIndex(of: subject)!] )
                   }
               }
               Spacer()
           }
                   .toolbar{
                       ToolbarItem(id: "done", placement: .confirmationAction){
                           Button(action: {
                               ue.onEdited()
                               doneSubject(subjectVM: subjects)
                           }){
                               Text("Done")
                           }
                       }
                       ToolbarItem(id: "cancel", placement: .cancellationAction){
                           Button(action: {
                               ue.onEdited(isCancelled: true)
                                 cancelSubject(subjectVM: subjects)
                           }){
                               Text("Cancel")
                           }
                       }
                   }
                   .navigationTitle("Edit: \(ue.name)")

       }
    }
    private func onEditing() -> Bool {
        for subject in ue.subjects {
            subject.onEditing()
        }
        return true
    }

    private func doneSubject(subjectVM: [SubjectVM]) {
        for subject in subjectVM {
            subject.onEdited()
        }
    }

    private func cancelSubject(subjectVM: [SubjectVM]) {
        for subject in subjectVM {
            subject.onEdited(isCancelled: true)
        }
    }
}

struct EditUE_Previews: PreviewProvider {
    static var previews: some View {
        EditUE(ue: UEVM(withModel: StubData().ueVMs[0].model), ueEditedCopy: UEVM(withModel: StubData().ueVMs[0].model))
    }
}
