//
//  ViewController.swift
//  Swfit_Day02_Demo
//
//  Created by Dang Thai Son on 9/16/15.
//  Copyright © 2015 Dang Thai Son. All rights reserved.
//

import UIKit

// Recursive Extension
enum TreeNode {
    case name(String)
    indirect case Node(TreeNode, TreeNode)
}

indirect enum Tree {
    case name(String)
    case Node(Tree, Tree)
}

class ViewController: UIViewController {
       override func viewDidLoad() {
        super.viewDidLoad()
        let a: String = "1"
        var b: String?
        let c = a ?? b
        

        // Guard must be transfer control state
        let maybeNumbers: [Int?] = [3, 7, nil, 12, 40]
        for maybeValue in maybeNumbers {
            guard let value = maybeValue else {
                print("No Value")
//                break
                continue
            }
            print(value)
        }
        
//        let NSHipsterBlog = iOSDevelopmentBlog(name: "NSHipster", URL: "http://nshipster.com/", Author: "Matt Thompson")
    }
}


// Function using Guard and If-else
struct iOSDevelopmentBlog {
    let name: String?
    let URL: String?
    let Author: String?
}

// original if-else style
//func originalNastyStyle (blog: iOSDevelopmentBlog) {
//    
//    if (let blogName = blog.name {
//        
//        return;
//    }
//    print("\(blog.name!)")
//
//    
//    
//    
//    
//    if let blogName = blog.name {
//        print("The \(blogName) blog is a great iOS Development Blog!")
//        
//        if let blogAuthor = blog.Author {
//            print("It is written by \(blogAuthor).")
//            
//            if let blogURL = blog.URL {
//                print("Visit it at \(blogURL)")
//            } else {
//                print("Search for it on your favorite on your favorite search engine.")
//            }
//        } else {
//            print("it is written by an unknown author.")
//        }
//    } else {
//        print("I don't know the name of this blog, but it's a good one!")
//    }
//}
//
// Common Guard style
//func originalGuardStyle (blog: iOSDevelopmentBlog) {
//    guard let blogName = blog.name else {
//        print("I don't know the name of this blog, but it's a good one!")
//        return
//    }
//    
//    print("The \(blogName) blog is a great iOS Development Blog!")
//    
//    guard let blogAuthor = blog.Author else {
//        print("it is written by an unknown author.")
//        return
//    }
//    
//    print("It is written by \(blogAuthor).")
//    
//    guard let blogURL = blog.URL else {
//        print("Search for it on your favorite on your favorite search engine.")
//        return
//        
//    }
//
//    print("Visit it at \(blogURL)")
//}

//func simpleOriginalNastyStyle (blog: iOSDevelopmentBlog) {
//    if let blogName = blog.name,
//        blogURL = blog.URL,
//        blogAuthor = blog.Author{
//            print("The \(blogName) blog is a great iOS Development Blog!")
//            print("It is written by \(blogAuthor).")
//            print("")
//            print("Visit it at \(blogURL)")
//    } else {
//        print("My information is incomplete, but I'm sure this iOS Development Blog is great!")
//    }
//}

//
//func simpleGuardStyle (blog: iOSDevelopmentBlog) {
//    guard let blogName = blog.name,
//        let blogURL = blog.URL,
//        let blogAuthor = blog.Author else {
//            print("My information is incomplete, but I'm sure this iOS Development Blog is great!")
//            return
//    }
//    
//    print("The \(blogName) blog is a great iOS Development Blog!")
//    print("It is written by \(blogAuthor).")
//    print("")
//    print("Visit it at \(blogURL)")
//}


func testItOld(a: Int?) {
    if let b = a {
        print("a: \(b)")
    } else {
        print("not ok")
    }
}

// Guard
func testItWithGuard(a: Int?) {
    guard let b = a else {
        print("not ok")
        return
    }
    print("a: \(b)")
}


