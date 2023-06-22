//
// Created by etudiant on 23/06/2023.
//

import SwiftUI
import CalculatorAverageVM

struct EditUE: View {
    @StateObject
    var ue: UEVM

    var body : some View {
       NavigationStack {
           ScrollView {
               HStack {
                   Text("Nom")
                   TextField("Nom", text: $ue.name)
                   Spacer()
               }
               HStack {
                   Text("Coefficient")
                   TextField("Coefficient", value: $ue.coefficient, formatter: NumberFormatter())
                   Spacer()
               }
               Spacer()
           }
                   .toolbar{
                       ToolbarItem(id: "done", placement: .confirmationAction){
                           Button(action: {
                               ue.isEditing.toggle()
                               ue.onEdited()
                           }){
                               Text("Done")
                           }
                       }
                       ToolbarItem(id: "cancel", placement: .cancellationAction){
                           Button(action: {
                               ue.isEditing.toggle()
                               ue.onEdited(isCancelled: true)
                           }){
                               Text("Cancel")
                           }
                       }
                   }
                   .navigationTitle("Edit: \(ue.name)")

       }
    }
}