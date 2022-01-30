import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    func saveWorkoutModel(model: WorkoutModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func updateWorkoutModel(model: WorkoutModel, bool: Bool) {
        try! localRealm.write {
            model.status = bool
        }
    }
}
