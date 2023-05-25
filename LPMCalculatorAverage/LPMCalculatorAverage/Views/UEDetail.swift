//
//  UEDetail.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI

struct UEDetail: View {
    @State private var scale: CGFloat = 1.5
    
    
    var body: some View {
        var note = ((self.scale/1.5)*10)
        var vrainote = note >= 20 ? 20 : note <= 0 ? 0 : note
        
        VStack{
            HStack{
                Text("UE1 Génie Logiciel")
                Spacer()
                Text("6")
                    .padding(.trailing, 10)
                
                    .padding(.trailing, 20)
                Image(systemName: "square.and.pencil")
            }
            .padding(.leading, 20)
            .padding(.bottom, 15)
            
            HStack {
                Capsule()
                    .fill(scale >= 1.5 ? Color.green : Color.red)
                    .frame(width: 75 * (scale >= 3.0 ? 3.1 : scale <= 0.1 ? 0.1 : scale), height: 25)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    self.scale = 1 + value.translation.width / 75
                                }
                        )
                
                Text("\(vrainote, specifier: "%.2f")")
                Spacer()
            }
        }
    }
}

struct UEDetail_Previews: PreviewProvider {
    static var previews: some View {
        UEDetail()
    }
}
