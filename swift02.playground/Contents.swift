import Foundation


//--- 12. STRUCT ---

//struct Person {
//    var fullName: String
//    var age: Int
//    var birthday: String
////    var birthday: Date?
//    var birthPlace: String?
//    var country = "Turkiye"
//
//    // initializers
//    init(fullName: String, age: Int, birthday: String) {
//        self.fullName = fullName
//        self.age = age
//        self.birthday = birthday
//    }
////    init(fullName2: String, age2: Int, birthday2: String) {
////        fullName = fullName2
////        age = age2
////        birthday = birthday2
////    }
//
//    init(name: String, surname: String, age: Int = -1, birthday: String = "N/A") {
//        self.fullName = "\(name) \(surname)"
//        self.age = age
//        self.birthday = birthday
//        self.country = "Japan"
//    }
//}
//
//// ta2lsm is an instance. Generated from Person struct
//var ta2lsm = Person(fullName: "Semih SENOL", age: 40, birthday: "06.09.1983")
//print(ta2lsm)
//
//var ta2lsm2 = Person(name: "Semih", surname: "SENOL")
//print(ta2lsm2)


// IMMUTABLE
//struct Person {
//    var fullName: String
//    var age: Int
//    var birthday: Date?
//    var country = "Turkiye"
//
//    init(name: String, surname: String, age: Int = -1, birthday: String = "N/A") {
//        self.fullName = "\(name) \(surname)"
//        self.age = age
//    }
//
//    func whereAreYou() -> String {
//        return "I'm in \(country)"
//    }
//
//    // not recommended to use "mutating" much. RISKY!
//    // This will change a member of a protected struct
//    mutating func yearPassed() {
//        age += 1
//    }
//}
//
//var person = Person(name: "Semih", surname: "SENOL", age: 40)
//print(person)
//
//person.age = 37
//person.country = "Korea"
//print(person)
//
//var person2 = person
//// copy on write. It is not a pointer value (REFERENCE TYPE) it is hard copy (VALUE TYPE)
//
//person.whereAreYou()
//person.yearPassed()
//print(person)



//--- 13. ACCESS MODIFIERS ---

// fileprivate, open, public...
//struct Person {
//    var fullName: String
//    private (set) var age: Int
//    // not possible to set this value when generating Person struct
//    // but it can be accessible from outside
//
//    init(fullname: String, age: Int = 40) {
//        self.fullName = fullname
//        self.age = age
//    }
//
//    // without mutating, it is not possible to change age
//    mutating func yearPassed() {
//        self.age += 1
//        logYearPassed()
//    }
//
//    // not accessible from outside
//    private func logYearPassed() {
//        print("one more year passed!")
//    }
//}
//
////var person = Person(fullName: "", age: -1)      // age is not accessible
////person.age += 1                                 // age is not accessible
//
//var person = Person(fullname: "")
//print(2023 - person.age)
//person.yearPassed()
//print(person)



//--- 14. PROPERTY OBSERVERS ---


//struct Person {
//    // MARK: 1. public variables
//    var fullName: String {
//        // when fullname has been changed
//        didSet {
//            nameChanged()
//        }
//        willSet {
//            print("full name will be changed from \(fullName) to \(newValue)")  // newValue is a special keyword
//        }
//    }
//    var age: Int {
//        didSet {
//            print("New age is: \(age)")
//            ageChanged()
//        }
//    }
//
//    // MARK: 2. private variables
//    private var birthYear: Int = 0
//
//    // MARK: 3. initializers
//    init (fullname: String, age: Int) {
//        self.fullName = fullname
//        self.age = age
//        ageChanged()
//    }
//
//    // MARK: 4. public and private methods
//    private mutating func nameChanged() {
//        print("New fullname is:", fullName)
//    }
//
//    private mutating func ageChanged() {
//        let year = Calendar.current.component(.year, from: Date())
//        birthYear = year - age
//    }
//}
//
//// didSet and willSet will not to be called when initializing
//var person = Person(fullname: "TA2LSM", age: 39)
//print(person)
//
//person.fullName = "test"
//person.age = 40
//print(person)



//--- 15. NESTED TYPES ---

//struct Game {
//    enum Status {
//        case playing, paused, finished
//    }
//
//    struct Card {
//        var letter: String
//    }
//
//    var status: Status = .paused        // default init: paused
//}
//
////let testStatus: Game.Status = .playing
//
//// member-wise
//var game = Game()
//print(game)
//
//// typealias
////typealias Status = Game.Status
////Game.Status.finished >> Status.finished
//
//// Emoji access: cmd + ctrl + space
//typealias 🃏 = Game.Card
//// These two are same below
////Game.Card(letter: "Hearts")
////🃏(letter: "Hearts")
//
////print(game)



//--- 16. CLASS ---

