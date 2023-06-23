//
//  EditSubject.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 23/06/2023.
//

import SwiftUI
import CalculatorAverageVM
import Stub

struct EditSubject: View {
    @StateObject
    var subject: SubjectVM
    @ObservedObject
    var subjectEditedCopy: SubjectVM

    var body: some View {
        VStack {
            HStack {
                Text("Nom")
                TextField("Nom", text: $subjectEditedCopy.name)
                Spacer()
            }
            HStack {
                Text("Coefficient")
                TextField("Coefficient", value: $subjectEditedCopy.coefficient, formatter: NumberFormatter())
                Spacer()
            }
        }
                .padding()
                .background(Color("LigthGrey"))
                .cornerRadius(5)
                .frame(width: 300, height: 100)

    }
}



struct EditSubject_Previews: PreviewProvider {
    static var previews: some View {
        EditSubject(subject: StubData().ueVMs[0].subjects[0], subjectEditedCopy: StubData().ueVMs[0].subjects[0])
    }
}
