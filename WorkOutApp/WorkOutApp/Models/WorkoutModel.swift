import Foundation
import RealmSwift

class WorkoutModel: Object {
    
    @Persisted var workoutName: String = "Unkown"
    @Persisted var workoutDate: Date
    @Persisted var wourkoutNumberOfDay: Int = 0
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
}
