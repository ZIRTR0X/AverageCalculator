//
//  home.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI

struct home: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    VStack{
                        blocs()
                    }
                    .padding(10)
                    
                    VStack{
                        UEsDetails()
                    }
                    .padding(10)
                }
            }
        }
        .navigationTitle("Calculete")
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
