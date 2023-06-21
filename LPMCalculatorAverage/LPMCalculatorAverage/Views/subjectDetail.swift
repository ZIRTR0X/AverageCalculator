//
//  UEDetail.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import CalculatorAverageVM
import Stub

struct SubjectDetail: View {
    @ObservedObject var subjectVM: SubjectVM
    @State private var scale: CGFloat = 1.5
    var capsuleSize = UIScreen.main.bounds.width * 0.15
    @State private var isLocked: Bool = false

    var body: some View {
        let note = ((self.scale/1.5)*10)
        let vrainote = note >= 20 ? 20 : note <= 0 ? 0 : note
        
        HStack{
            Button(action: {
                isLocked.toggle()
                subjectVM.isLocked = isLocked
            }){
                Image(systemName: isLocked ? "lock.fill" : "lock.open")
                    .foregroundColor(Color.blue)
            }
            
            
            VStack{
                HStack{
                    Text(subjectVM.name)
                    Spacer()
                    Text("\(subjectVM.coefficient)")
                        .padding(.trailing, 30)
                }
                .padding(.leading, 20)
                .padding(.bottom, 15)
                
                HStack {
                    Capsule()
                        .fill(scale >= 1.5 ? Color.green : Color.red)
                        .frame(width: self.capsuleSize * (scale >= 3.0 ? 3.1 : scale <= 0.1 ? 0.1 : scale), height: 25)
                            .gesture(
                                    isLocked ? nil : DragGesture()
                                    .onChanged { value in
                                        self.scale = 1 + value.translation.width / self.capsuleSize
                                    }
                            )
                    
                    Text("\(vrainote, specifier: "%.2f")")
                    Spacer()
                }
                Divider()
            }
            
        }
        
    }
}

struct SubjectDetail_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetail(subjectVM: StubData().ueVMs[0].subjects[0])
    }
}
