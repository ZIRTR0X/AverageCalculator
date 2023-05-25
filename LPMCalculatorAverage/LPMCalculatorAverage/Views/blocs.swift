//
//  blocs.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI

struct blocs: View {
    var body: some View {
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
                Text("11.67")
                Image(systemName: "graduationcap.circle.fill")
            }
            HStack{
                Image(systemName: "doc.on.doc.fill")
                Text("Projet/Stage")
                Spacer()
                Text("11.67")
                Image(systemName: "graduationcap.circle.fill")
            }
            
        }
            .padding(30)
            .background(Color("LigthGrey"))
            .cornerRadius(10)
        
        
    }
}

struct blocs_Previews: PreviewProvider {
    static var previews: some View {
        blocs()
    }
}
