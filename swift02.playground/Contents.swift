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


