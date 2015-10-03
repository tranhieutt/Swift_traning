//: Playground - noun: a place where people can play

import UIKit


// Subclass
class Video {
    
}
class Movie:Video {
    var title: String?
    var ratting: Double?
}
class TVShow: Video {
    var title: String?
    var year: Int?
}
func getCellContent() {
    
    var item: Video?
    var cellContent: String?
    if item is Movie? {
        let movie = item as? Movie
        cellContent = String{ return "Title \( movie!.title ) - rating: \( movie!.ratting )" }
    }
    if item is TVShow? {
        let tvShow = item as? TVShow
        cellContent = String{ return "Title \( tvShow!.title ) - year: \( tvShow!.year )"
        }
    }
}

// Protocol Extension
//protocol ListItemPresenter {
//    var cellContent: String { get }
//}
//extension Movie: ListItemPresenter {
//    var cellContent: String{ return "Title \( self.title ) - rating: \( self.rating )" }
//}
//
//extension TVShow: ListItemPresenter {
//    var cellContent: String{ return "Title \( self.title ) - year: \( self.year )" }
//}
//func getCellContent() {
//    
//    var item: ListItemPresenter?
//    var cellContent = item?.cellContent
//}


// Self Requirement
protocol Behaviour {
    func methodA()
    func methodB()
}

class ClassA: Behaviour {
    init() {
        print("classA initializer")
    }
    func methodB() {
        print("methodB in default extension")
    }
}

class ClassB: Behaviour {
    init() {
        print("classB initializer")
    }
    func methodB() {
        print("methodB in default extension")
    }

}
// try to comment out Extension to see different
extension Behaviour {
    func methodA() {
        print("methodA in default extension")
    }
    
    func methodB() {
        print("methodB in default extension")
    }
}

// Extension to that protocol that will only be aplicable to instances of ClassB
extension Behaviour where Self: ClassB {
    func methodB() {
        print("methodB in specific to class B extension")
    }
}

// Demo
let a: Behaviour = ClassA()
let b: Behaviour = ClassB()

//a.methodA()
//a.methodB()

b.methodA()
b.methodB()
