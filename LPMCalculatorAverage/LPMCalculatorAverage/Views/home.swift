//
//  home.swift
//  LPMCalculatorAverage
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import CalculatorAverageLibrary
import CalculatorAverageVM
import Stub

struct home: View {
//    @StateObject
//    var UEs: [UEVM]
    @StateObject
    var manager: ManagerVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    VStack{
                        blocs(manager: manager)
                    }
                    .padding(10)
                    
                    VStack{
                        UEsDetails(manager: manager)
                    }
                    .padding(10)
                }
            }
            .navigationTitle("Calculette")
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        home(manager: ManagerVM(withUEs: StubData().ueVMs))
    }
}
