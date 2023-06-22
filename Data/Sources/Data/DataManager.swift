import Foundation
import CalculatorAverageVM
import CalculatorAverageLibrary

public struct DataManager {
    private let dataKey = "UEDataKey"

    public init() {}

    public func save(ue: [UE]) {
        do {
            let jsonData = try JSONEncoder().encode(ue)
            UserDefaults.standard.set(jsonData, forKey: dataKey)
        } catch {
            print("Error encoding data: \(error)")
        }
    }

    public func load() -> [UE]? {
        guard let data = UserDefaults.standard.data(forKey: dataKey) else {
            return nil
        }

        do {
            let ueList = try JSONDecoder().decode([UE].self, from: data)
            return ueList
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }

}

