//
//  CodeTestObject.swift
//  IOSSwiftProj
//
//  Created by liquangang on 2018/4/8.
//  Copyright © 2018年 liquangang. All rights reserved.
//

import UIKit

class CodeTestObject: NSObject {
    var tmpName = "我是对象"
    var myStr:String = ""
    static var tmpClassProperty = "类属性"
    class var tmpSecondClassProperty: String {
        return "我也是类属性"
    }
    var myClassCount = 0
    
    
    //MARK:setter getter方法
    var tmpStr: (String) {
        get{
            return myStr
        }
        set{
            //newvalue是默认参数名称
            myStr = newValue
        }
    }
    
    //MARK:只读属性
    var onlyReadValue: Int {
        return 1
    }
    
    //MARK:属性观察器
    var monitorProper: Int = 0 {
        willSet{
            print(monitorProper, newValue)
        }
        didSet{
            print(monitorProper, oldValue, "设置完成")
        }
    }
    
    //MARK:实例方法（对象方法）
    func increment() {
        myClassCount += 1
    }
    
    func incrementBy(count:Int) {
        myClassCount += count
    }
    
    func resetClassCount() {
        myClassCount = 0
    }
    
    
    //MARK:类型方法
    static func classMethodTest() {
        print("我是类方法")
    }
    
    class func classMethodTest2() {
        print("我也是类方法") 
    }
    
    //MARK:定义下标
    subscript(index:Int) -> Int {
        return index
    }
    
}
