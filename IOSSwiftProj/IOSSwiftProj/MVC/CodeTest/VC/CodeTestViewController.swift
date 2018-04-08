//
//  CodeTestViewController.swift
//  IOSSwiftProj
//
//  Created by liquangang on 2018/4/8.
//  Copyright © 2018年 liquangang. All rights reserved.
//

import UIKit

class CodeTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        grammarTest()
        //        print(myFirstSwiftFunc(firstParameter: 1, secondParameter: 2))
        //        print(tuplesTest(numArr: [1, 2, 3, 4, 5, 6, 7, 0]))
        print(funcNest())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 基本语法练习
    func grammarTest() {
        //打印
        //        print("Hello world")
        //
        //        //常量
        //        let commonNum = 1
        //        print(commonNum)
        //
        //        //变量
        //        var mutableNum:Int = 1
        //        mutableNum = mutableNum + 1
        //        print(mutableNum)
        
        //        //值类型
        //        let tempStr = "lalalal"
        //        let tempNum = 1
        //        let newNum = tempStr + String(tempNum) //强制类型转化 类型（变量名）
        //        print(newNum)
        
        //字符串中包含值
        //        let tempNum = 1
        //        let tempStr = "000000000\(tempNum)\(tempNum)(tempNum)" //字符串与其他类型值得拼接
        //        print(tempStr)
        
        //创建数组字典
        //        var tmpArr = ["1", "2", "3"]
        //        tmpArr[0] = "0"
        //        var tmpDic = ["1":"一",
        //                      "2":"二"]
        //        tmpDic["1"] = "零"
        //        print(tmpArr,tmpDic)
        
        //控制流 if else for
        //        let tmpArr = [1, 2, 3, 4]
        //        var tmpValue = 0
        //        for num in tmpArr {
        //            if num == 0 {
        //                tmpValue += num
        //            }else{
        //                tmpValue -= num
        //            }
        //            print(tmpValue)
        //        }
        
        //可选值
        //类型？:表示类型可选
        //变量名 ？？另一个确定类型的变量名:表示无默认类型时选择后面的变量类型作为数据类型
        //        let tmpStr1:String = "fasdfasdf"
        //        var tmpStr:String? = "lallala"
        //        tmpStr = "fffff"
        //        print(tmpStr ?? tmpStr1)
        
        //switch case
        //        let tmpValue = "aaaaabbbbb"
        //        switch tmpValue {
        //        case "aaa":
        //            print("aaaa")
        //        case let x where x.hasSuffix("bbb"):
        //            print("bbb")
        //        default:
        //            print("ccc")
        //        }
        
        //字典数组遍历 不使用的数据可以使用下划线代替
        //        let tmpDic = ["1":[1, 2, 3, 4, 5, 6],
        //                      "2":[1, 2, 3, 4, 5, 6]]
        //        for (_, tmpArr) in tmpDic {
        //            for tmpNum in tmpArr {
        //                print(tmpNum)
        //            }
        //        }
        //        print(tmpDic)
        
        //循环
        //        var tmpNum = 1
        //        while tmpNum < 100 {
        //            tmpNum += 1
        //        }
        //        print(tmpNum)
        
        //        var tmpNum = 1
        //        repeat {
        //          tmpNum += 1
        //        } while tmpNum < 100
        //        print(tmpNum)
        
        //        var tmpNum = 1
        //        for _ in 0..<100 {
        //            tmpNum += 1
        //        }
        //        print(tmpNum)
        
    }
    
    //函数结构
    //func 函数名（参数标签 参数名：参数数据类型, 参数标签 参数名：参数数据类型）-> 返回值{}
    //下划线作用：代替一些可以不用写的部分 比如未使用的变量 参数标签等
    func myFirstSwiftFunc(firstParameter num1:Int, secondParameter num2:Int) -> Int {
        return num1 + num2
    }
    
    //使用元组作为参数
    func tuplesTest(numArr:[Int]) -> (min:Int, max:Int, sum:Int) {
        var min = numArr[0]
        var max = numArr[0]
        var sum = 0
        
        for num in numArr {
            sum += num
            if num < min {
                min = num
            }
            if num > max {
                max = num
            }
        }
        
        return (min, max, sum)
    }
    
    //函数嵌套 此函数返回值是一个函数
    func funcNest() -> ((Int) -> Int) {
        func funcNestTest(num:Int) -> Int {
            return num + 1
        }
        return funcNestTest
    }
    
    

}
