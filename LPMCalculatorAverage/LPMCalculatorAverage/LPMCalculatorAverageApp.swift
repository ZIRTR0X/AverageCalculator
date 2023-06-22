import SwiftUI
import CalculatorAverageLibrary
import CalculatorAverageVM
import Stub
import Data

@main
struct LPMCalculatorAverageApp: App {
    private let dataManager = DataManager()
    @StateObject private var managerVM: ManagerVM = ManagerVM(withUEs: loadUEVMs())
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            home(manager: managerVM)
                    .onChange(of: scenePhase) { newPhase in
                        if newPhase == .inactive {
                            saveUEVMs(managerVM.ueVMs)
                        }
                    }
        }
    }

    private func saveUEVMs(_ ueVMs: [UEVM]) {
        let ueList: [UE] = ueVMs.map { $0.model }
        dataManager.save(ue: ueList)
    }

    private static func loadUEVMs() -> [UEVM] {
        let dataMger = DataManager()
        guard let ueList = dataMger.load() else {
            return StubData().ueVMs
        }

        return ueList.map { UEVM(withModel: $0) }
    }
}
