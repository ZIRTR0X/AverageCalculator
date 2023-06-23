//
// Created by etudiant on 23/06/2023.
//

import SwiftUI
import CalculatorAverageVM

struct EditUE: View {
    @StateObject
    var ue: UEVM
    @ObservedObject
    var ueEditedCopy: UEVM
    @State private var editedName = ""

    var body : some View {
       NavigationStack {
           ScrollView {
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
               Spacer()
           }
                   .toolbar{
                       ToolbarItem(id: "done", placement: .confirmationAction){
                           Button(action: {
                               ue.onEdited()
                           }){
                               Text("Done")
                           }
                       }
                       ToolbarItem(id: "cancel", placement: .cancellationAction){
                           Button(action: {
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
