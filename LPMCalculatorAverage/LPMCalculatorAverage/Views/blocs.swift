//
//  blocs.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import CalculatorAverageVM
import Stub

struct blocs: View {
    @ObservedObject
    var manager: ManagerVM

    var body: some View {
        var globalAverage: Double = calculGlobalAverage()
        var projectAverage: Double = calculProjectAverage()

        VStack{
            HStack{
                Image(systemName: "doc.on.doc.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                Text("Blocs")
                    .font(.system(size: 25))
                    .bold()
                Spacer()
            }
            HStack{
                Text("Vous devez avoir la moyenne chacun de ces blocs pour avoir le diplôme.")
                Spacer()
            }
            HStack{
                Image(systemName: "doc.on.doc.fill")
                Text("Total")
                Spacer()
                Text("\(globalAverage, specifier: "%.2f")")
                    .padding(.trailing, 30)
                Image(systemName: "graduationcap.circle.fill")
            }
            HStack{
                Image(systemName: "doc.on.doc.fill")
                Text("Projet/Stage")
                Spacer()
                Text("\(projectAverage, specifier: "%.2f")")
                    .padding(.trailing, 30)
                Image(systemName: "graduationcap.circle.fill")
            }
            
        }
            .padding(30)
            .background(Color("LigthGrey"))
            .cornerRadius(10)
    }

    func calculGlobalAverage() -> Double {
        var total = 0.0
        for ue in manager.ueVMs {
            total += ue.average
        }
        return total / Double(manager.ueVMs.count)
    }

    func calculProjectAverage() -> Double {
        var total = 0.0
        for ue in manager.ueVMs {
            if ue.isProject {
                total += ue.average
            }
        }
        return total / Double(manager.ueVMs.count)
    }
}

struct blocs_Previews: PreviewProvider {
    static var previews: some View {
        blocs(manager: ManagerVM(withUEs: StubData().ueVMs))
    }
}
