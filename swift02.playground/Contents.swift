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

// struct's has no "inheritance" feature also ne "init" and "deinit"


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

//class Game {
//    private (set) var status: String = ""
//    private (set) var currentPlayer: String = "player1"
//    private (set) var level: Int = -1
//
//    func changePlayer() {
//        if currentPlayer == "player1" {
//            currentPlayer = "player2"
//        } else {
//            currentPlayer = "player1"
//        }
//    }
//}

//let game = Game()       // new game. "let" means game's memory address is fixed not member's values in the class
//let game2 = game        // reference type copy NOT like struct (value type, copy on write)
//let game3 = Game()      // new game
//game.changePlayer()
//
//// these two below have same values. game 3 is different
//game.currentPlayer
//game2.currentPlayer
//game3.currentPlayer

// struct OR class
// 1. Immutability
//struct User {
//    var name: String
//}
//var user1 = User(name: "user1")     // memberwise initializer
//var user2 = user1
//user2.name = "user2"        // user1 will stay unchanged
//print(user1, user2)
//
//// 2. Memory: user3 and user4 example below
//class User_c {
//    var name: String
//
//    init (name: String) {
//        self.name = name
//    }
//}
//var user3 = User_c(name: "user3")
//var user4 = user3
//user4.name = "user4"        // user3 will also change
//print(user3.name, user4.name)
//
//// value type copy
//var db1: Double = 1.2
//var db2 = db1
//db2 = 1.5
//print(db1, db2)             // db1 and db2 are different values
//
//// reference type copy (this part is not in the lesson)
//var db3: UnsafeMutablePointer<Double> = .init(&db1)        // like this >> double *db3 = &db1
//db3.pointee = 2.0
//print("db1 memory address: \(UnsafeRawPointer(&db1)) and value: \(db1)")
//print("db3 memory address: \(UnsafeRawPointer(&db3)), reference: \(db3) and value: \(db3.pointee)")
//
////3. class has deinitialization (will be spoken in later)
//
//// identity operator
//let game1 = Game()
//let game2 = Game()
//let game3 = game1
//
//// === is an identity operator / == is for equatable. This two are DIFFERENT
//if game1 === game2 {
//    print("game1 and game2 have same reference")
//} else if game1 === game3 {
//    print("game1 and game3 have same reference")
//}



//--- 17. DEINITIALIZATION ---

// instance: the structure/object which is generated from class, struct ..etc
// Needs to memory cleanup

// "static" cannot to be used in the global scope. Used in enum for make it easy
//enum Constant {
//    static let family = Family()
//}
//
//class Family {
//    var names: [String] = [] {
//        didSet {
//            print("names updateded for \(names)")
//        }
//    }
//
//    func add(person: Person) {
//        names.append(person.name)
//    }
//
//    func remove(person: Person) {
//        // assume that names are unique
//        if let idx = names.firstIndex(of: person.name) {
//            names.remove(at: Int(idx))
//        }
//    }
//}
//
//class Person {
//    let name: String
//
//    init(name: String) {
//        print("initialized")
//        self.name = name
//        Constant.family.add(person: self)               // not safe just for an example
//    }
//
//    // when arc == 0
//    deinit {
//        print("deinitialized for \(name)")
//        Constant.family.remove(person: self)            // not safe just for an example
//    }
//}
//
//// ARC (automated reference counting)
////var person: Person?                 // for deinitializing this is an optional definition
////var person2: Person?
////var person3: Person?
////
////person = Person(name: "TA2LSM")     // arc = 1 (for person)
//////person = nil                      // arc = arc - 1 (for person) >> 0 : there is no "person" anymore
////// OR
////person2 = person                    // arc = 2 (for person)
////person = nil                        // arc = arc - 1 (for person)
////person2 = nil                       // arc = arc - 1 (for person) >> 0
////
////person3 = Person(name: "test")      // arc = 1 (for person3)
////person3 = nil
//
////Person(name: "test")                // directly deinit
//
//var person1: Person? = Person(name: "ahmet")
//var person2: Person? = Person(name: "semih")
//var person3: Person? = Person(name: "senol")
//
//// person2 passed away...
//person2 = nil
////print()



//--- 18. INHERITANCE ---

// super class -> subclass -> [base class]

//class Person {
//    var name: String
//
//    var charCount: Int {
//        return name.count
//    }
//
//    init (name: String) {
//        self.name = name
//    }
//
//    func sayHello() {
//        print("Hello I'm base person class with name: \(name)")
//    }
//}
//var person1 = Person(name: "ali")
//person1.sayHello()
//person1.charCount

//class Human: Person {
//    var age: Int
//
//    override var charCount: Int {
//        return -1
//    }
//
//    init(name: String, age: Int) {
//        self.age = age                               // needs to be initialized "before" super.init
//        super.init(name: name)
//    }
//
//    override var name: String {
//        didSet {
//            print("name is changed to \(name)")
//        }
//    }
//
//    func walk() {
//        //sayHello()                                // super.sayHello()
//        print("\(name) is walking...")              // super.name
//    }
//
//    // human's sayHello is different from super class (override)
//    override func sayHello() {
//        super.sayHello()                            // if prints sayHello() causes infinite loop
//        print("Hello I'm human named \(name)")
//    }
//}
//
//var human1 = Human(name: "veli", age: 23)
//human1.sayHello()
//human1.walk()
//human1.name = "test"
//print(human1.age)


//class Person {
//    final let name: String
//
//    init (name: String) {
//        self.name = name
//    }
//
//    final func sayHello() {
//        print("Hello I'm base person class with name: \(name)")
//    }
//}
//
//// "Human" class CAN NOT to be used as an inheritance because of "final" keyword
//final class Human: Person {
//    let parentName: String
//
//    // CAN NOT to be observed because of "final" keyword in "Person" class
////    override name: String {
////        didSet {
////
////        }
////    }
//
//    init(name: String, parentName: String) {
//        self.parentName = parentName
//        super.init(name: name)
//    }
//
//    // CAN NOT to be override because of "final" keyword in "Person" class
////    override func sayHello() {
////        print("Hello I'm human")
////    }
//
//    func walk() {
//        print("\(name) is walking...")              // super.name
//    }
//}
//var human1 = Human(name: "ali", parentName: "ayse")
//human1.sayHello()
//print("Human1 > name: \(human1.name), parent name: \(human1.parentName)")
//human1.walk()

// There is no "multiple inheritance" in swift



//--- 19. EXTENSION ---

// adding new properties to some class or struct later
//struct Person {
//    let name: String
//    let surname: String
//}
//
//extension Person {
//    var fullname: String {
//        return "\(name) \(surname)"
//    }
//
//    //let age: Int                          // new stored variable CAN NOT to be added!
//
//    func printFullname() {
//        print("\(fullname)")
//    }
//}
//let person1 = Person(name: "ali", surname: "aslan")
//person1.printFullname()


//extension Int {
//    static var defaultMargin: Int {     // static keyword used for Int "type" (built in types)
//        // no "self" here!
//        return 8
//    }
//
//    var square: Int {                   // just var keyword used for int "instance variable"
//        return self * self
//    }
//}
//Int.defaultMargin
//Int.random(in: 0..<100)

//let x: Int = 4
//x.square
//print(4.square)

//extension Date {
//    static func random() -> Date {
////        return Date().addingTimeInterval(Double.random(in: 0...1000))
////        Date().addingTimeInterval(Double.random(in: 0...1000))      // add ramdom value to current time
//        Date(timeIntervalSince1970: Double.random(in: 0...1000000000))
//    }
//}
//Date.random()

//extension String {
//    func subString(from: Int, to: Int) -> String {
//        let startIdx = self.index(self.startIndex, offsetBy: from)
//        let stopIdx = self.index(self.startIndex, offsetBy: to)
//        return String(self[startIdx...stopIdx])
//    }
//
//    func subString(range: ClosedRange<Int>) -> String {
//        let startIdx = self.index(self.startIndex, offsetBy: range.lowerBound)
//        let stopIdx = self.index(self.startIndex, offsetBy: range.upperBound)
//        return String(self[startIdx...stopIdx])
//    }
//
//    // subscript
//    subscript(index: Int) -> Character {
//        let index = self.index(self.startIndex, offsetBy: index)    // int to index
//        return self[index]
//    }
//}
//"test string".subString(from: 3, to: 8)
//"test string".subString(range: 3...8)
//"test string"[9]



//--- 20. PROTOCOLS ---

// like interface, schema, contract: rules must be obeyed by classes, structs, enums ...etc
// requirements for properties, functions...
//
//protocol protPerson {
//    var name: String { get set }
//    var age: Int { get set }
//
////    var number: Int { get set }             // * 1 *
//    var number: Int { get }                 // * 2 *
//
////    func func1()
//}
//
//// person class "conforms" to protPerson
//class Person: protPerson {
//    var name: String                        // this MUST be the same access level with its own protocol
//    var age: Int
////    private(set) var number: Int          // not allowed for * 1 *
//    private(set) var number: Int            // private(set) >> number only be set internally
//
//    init(name: String, age: Int? = 0, number: Int) {
//        self.name = name
//        self.age = age!
//        self.number = number
//    }
//
////    func func1() {
////
////    }
//}
//
//class Animal: protPerson {
//    var name: String                        // this MUST be the same access level with its own protocol
//    var age: Int
////    private(set) var number: Int          // not allowed for * 1 *
//    private(set) var number: Int            // private(set) >> number only be set internally
//
//    init(name: String, age: Int? = 1, number: Int) {
//        self.name = name
//        self.age = age!
//        self.number = number
//    }
//
////    func func1() {
////
////    }
//}
//
//var person1 = Person(name: "TA2LSM", age: 0, number: 1764)
////print(person1.age)
////print(person1.number)
////person1.age = 2                     // not allowed !!!
////person1.number = 200                // not allowed
//
//if let isProtOk = person1 as? protPerson {
////    print("suitable for protocol")
//
////    isProtOk unwrapped to protPerson
//    print(isProtOk.number)
//}
//
////let protPersonArray: [Person] = [
////    Person(name: "ali", number: 23),
////    Person(name: "veli", number: 56),
//////    Animal(name: "cat", number: 345)      // not allowed !!
////]
////print(protPersonArray[1].age)
//
//let protPersonArray: [protPerson] = [
//    Person(name: "ali", number: 23),
//    Person(name: "veli", number: 56),
//    Animal(name: "cat", number: 345)      // allowed
//]
//print(protPersonArray[2].age)
//
//protPersonArray.first?.number
//protPersonArray.first?.age
////...


//protocol protPerson {
//    var number: Int { get }
//
//    func func1()
//}
//
//class Person: protPerson {
//    var number: Int                 // stored values MUST be in class
//
//    init(number: Int) {
//        self.number = number
//    }
//}
//
//extension Person {
//    func func1() {
//        print("extension function called with number \(number)" )
//    }
//}
//var person1 = Person(number: 13)
//person1.func1()


//protocol Printable {
//    func myPrint()
//}
//protocol Multipliable {
//    func multiply() -> Int
//}
//
//extension Int: Printable, Multipliable {
//    func multiply() -> Int {
//        return self * self
//    }
//
//    func myPrint() {
//        print("printing integer: \(self)")
//    }
//}
//
//extension Double: Printable {
//    func myPrint() {
//        print("printing double: \(self)")
//    }
//}

//3 as? Printable
//3.0 as? Printable
//3.myPrint()
//(0.002).myPrint()
//2.multiply()


//protocol Breathing {
//
//}
//
//class Animal {
//
//}
//
//class Human: Animal, Breathing {
//
//}


//protocol Cooler {
//    var model: String { get }
//    var temp: Double { get set }
//
//    func cool(it: String)
////    func printModel()
//}
//
//// Protocol Extension
//extension Cooler {
//    func printModel() {
//        print("The model is: \(model)")
//    }
//}
//
//class Fridge: Cooler {
//    var model: String
//    var temp: Double
//
//    init(model: String, temp: Double) {
//        self.model = model
//        self.temp = temp
//    }
//
//    func cool(it: String) {
//        //check the door
//    }
//
//    // override comment this method and check again...
////    func printModel() {
////        //...
////    }
//}
//
//class Truck: Cooler {
//    var model: String
//    var temp: Double
//
//    init(model: String, temp: Double) {
//        self.model = model
//        self.temp = temp
//    }
//
//    func cool(it: String) {
//        //start engine, lock the doors
//    }
//}
//
//let fridge = Fridge(model: "Siemens", temp: 4.5)
//fridge.cool(it: "beer")
//fridge.printModel()



//--- 21. EQUATABLE & HASHABLE ---

