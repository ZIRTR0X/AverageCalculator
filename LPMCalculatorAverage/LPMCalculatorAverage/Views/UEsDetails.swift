//
//  UEsDetails.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import CalculatorAverageVM
import Stub

struct UEsDetails: View {
    @ObservedObject
    var manager: ManagerVM

    var body: some View {
        VStack{
            HStack {
                Image(systemName: "doc.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                Text("UEs")
                    .font(.system(size: 25))
                    .bold()
                Spacer()
            }
            HStack{
                Text("Détail des UEs")
                Spacer()
            }
            VStack{
                ForEach(manager.ueVMs) { ue in
                    UEDetail(ueVM: ue, showEdit: true)
                }
            }
            
        }
        .padding(30)
        .background(Color("LigthGrey"))
        .cornerRadius(10)
        
    }
}

struct UEsDetails_Previews: PreviewProvider {
    static var previews: some View {
        UEsDetails(manager: ManagerVM(withUEs: StubData().ueVMs))
    }
}
