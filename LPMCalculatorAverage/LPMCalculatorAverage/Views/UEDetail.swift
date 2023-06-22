//
//  UEDetail.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import CalculatorAverageVM
import Stub

struct UEDetail: View {
    @ObservedObject var ueVM: UEVM
    var showEdit: Bool = false
    
    var body: some View {
        let note = ueVM.average
        let scaledNote = (note / 10) * 1.5
        let capsuleSize = calculateCapsuleSize(note: note)

        HStack{
            
            VStack{
                HStack{
                    Text(ueVM.name)
                    Spacer()
                    Text("\(ueVM.coefficient)")
                        .padding(.trailing, 30)
                }
                .padding(.leading, 20)
                .padding(.bottom, 15)
                
                HStack {
                    Capsule()
                        .fill(scaledNote >= 1.5 ? Color.green : Color.red)
                        .frame(width: capsuleSize, height: 25)
                    
                    Text("\(ueVM.average, specifier: "%.2f")")
                    Spacer()
                }
                Divider()
            }
            
            NavigationLink (destination: UEPage(ueVM: ueVM)) {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(Color.blue)
                    .opacity(showEdit ? 1 : 0)
                    .disabled(!showEdit)
            }
        }
    }

    func calculateCapsuleSize(note: Double) -> CGFloat {
        let scaledNote = (note / 10) * 1.5
        let clampedNote = max(0.1, min(3.0, scaledNote))
        let capsuleSize = UIScreen.main.bounds.width * 0.15
        return capsuleSize * clampedNote
    }
}


struct UEDetail_Previews: PreviewProvider {
    static var previews: some View {
        UEDetail(ueVM: StubData().ueVMs[1])
    }
}
