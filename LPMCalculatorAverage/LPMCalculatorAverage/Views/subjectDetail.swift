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
        let note = Binding<Double>(
                get: { subjectVM.average },
                set: { newValue in
                    subjectVM.average = newValue >= 20 ? 20 : newValue <= 0 ? 0 : newValue
                    scale = CGFloat(newValue) / 10 * 1.5
                }
        )
        let capsuleSize = calculateCapsuleSize(note: note.wrappedValue)

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
                            .fill(note.wrappedValue >= 10 ? Color.green : Color.red)
                            .frame(width: capsuleSize, height: 25)
                            .gesture(
                                    isLocked ? nil : DragGesture()
                                            .onChanged { value in
                                                self.scale = 1 + value.translation.width / self.capsuleSize
                                                note.wrappedValue = Double(self.scale / 1.5 * 10)
                                            }
                            )

                    Text("\(note.wrappedValue, specifier: "%.2f")")
                    Spacer()
                }
                Divider()
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


struct SubjectDetail_Previews: PreviewProvider {
    static var previews: some View {
        SubjectDetail(subjectVM: StubData().ueVMs[0].subjects[0])
    }
}
