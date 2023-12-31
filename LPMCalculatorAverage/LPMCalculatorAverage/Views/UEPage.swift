//
//  UEPage.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import CalculatorAverageVM
import Stub

struct UEPage: View {
    @ObservedObject var ueVM: UEVM
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack {
                    UEDetail(ueVM: ueVM)
                        .padding(30)
                    VStack {
                        HStack {
                            Image(systemName: "multiply.circle.fill")
                            Text("coefficient: ")
                            Text("\(ueVM.coefficient)")
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "note.text")
                            Text("Détails des notes")
                            Spacer()
                        }
                    }
                    .padding(.vertical, 30)

                    VStack {
                        ForEach(ueVM.subjects) { subject in
                            SubjectDetail(subjectVM: subject)
                        }
                    }
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        ueVM.onEditing()
                    }) {
                        Image(systemName: "pencil.circle.fill")
                    }
                    .sheet(isPresented: $ueVM.isEditing) {
                        EditUE(ue: ueVM, ueEditedCopy: ueVM.editedCopy!)
                    }
                }
            }
            .navigationTitle(ueVM.name)
        }
    }
}

struct UEPage_Previews: PreviewProvider {
    static var previews: some View {
        UEPage(ueVM: StubData().ueVMs[1])
    }
}
