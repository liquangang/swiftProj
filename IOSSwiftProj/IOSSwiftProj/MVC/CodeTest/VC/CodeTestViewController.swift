//
//  CodeTestViewController.swift
//  IOSSwiftProj
//
//  Created by liquangang on 2018/4/8.
//  Copyright © 2018年 liquangang. All rights reserved.
//

import UIKit

//MARK:枚举
enum MaleType {
    case boy
    case girl
}

//MARK:枚举相关值
enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}

//MARK:枚举原始值
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

//MARK:结构体
struct studentMarks {
    var mark1 = 100
    var mark2 = 78
    var mark3 = 98
    
    init(num1: Int, num2: Int, num3: Int) {
        self.mark1 = num1
        self.mark2 = num2
        self.mark3 = num3
    }
    
    init(num: Int) {
        self.init(num1: num, num2: num, num3: num)
    }
}

//MARK:可以传值的结构体
struct MarksStruct {
    var mark: Int
    
    init(mark: Int) {
        self.mark = mark
    }
}

class MyClass {
    var myClassName = "我没有继承父类，怎么回事"
    
}

//MARK: 实例方法中修改值类型（结构体和枚举）的值
struct area {
    var areaName = "name"
    
    mutating func updateAreaName(newAreaName: String) {
        areaName += newAreaName
        print(areaName)
    }
    
}

//MARK:类拓展
extension UIViewController {
    
    //MARK:类拓展计算型属性
    var myName:String {
        get{
          return "我是vc"
        }
    }
    
    func extensionVcMethod() {
        print("我是vc的拓展方法")
    }
    
    //MARK:拓展下标
    subscript(index: Int) -> Int {
        return index * 10
    }
    
}

//MARK:拓展构造器
struct TmpStruct1 {
    var a = 1
}

extension TmpStruct1 {
    init(num: Int) {
        self.a = num
    }
}

//MARK:拓展实例方法
extension Int {
    mutating func updateInt() {
        self = 100
    }
}

//MARK:继承父类
class StudentDetail {
    var heigth:Double!
    var name:String!
    var mark1:Int!
    var mark2:Int!
    var tmpProper:String {
        return "我是父类的属性"
    }
    var tmpProper1 = "aaaaa"
    final var tmpProper2:String {
        return "我是用来测试防止重写属性的属性"
    }
    
    
    
    init(h:Double, name:String, mark1:Int, mark2:Int) {
        self.heigth = h
        self.name = name
        self.mark1 = mark1
        self.mark2 = mark2
    }
    
    func show() {
        print(heigth, name, mark1, mark2)
    }
}


//MARK:继承子类
class Quangang: StudentDetail {
    init() {
        super.init(h: 180, name: "quangang", mark1: 100, mark2: 100)
    }
    
    //MARK:重写属性
    override var tmpProper: String {
        return super.tmpProper + "我是子类重写的属性，咱俩还在一起"
    }
    
    
    //MARK:重写方法
    override func show() {
        print("我是叫全港的子类")
        super.show()
    }
    
    //MARK:重写属性观察器
    override var tmpProper1: String {
        didSet{
            print("我已经重写了属性观察器， 并且我已经被改变了")
        }
    }
    
//    //防止重写属性 父类中final修饰的属性无法重写
//    override var tmpProper2: String {
//        return "llalalal"
//    }

}

//MARK:final
//final修饰的类无法被继承
final class NoSonClass {
    
}

//不能继承final修饰的类
//class SonClass: NoSonClass {
//
//}

//MARK:构造器
class TmpClass {
    
    //默认构造器会自动创建一个所有属性值都设为默认值的实例
    
    //推荐在声明属性时 同时给属性赋初值
    var tmpProper = 1
    var tmpProper1 = 2
    
    //可选类型属性
    var tmpProperty2: String?
    
    //常量可选属性 只能在持有该属性的类中的构造器中设置该属性的值 子类中不能修改
    let tmpProperty3: String?
    
    //不带参数构造器
    init() {
        tmpProper = 10
        tmpProper1 = 11
        self.tmpProperty3 = "aaa"
    }
    
    //有参构造器 并且有内部和外部参数名 并且内部和外部参数名相同
    init(num1: Int, num2: Int) {
        self.tmpProper = num1
        self.tmpProper1 = num2
        self.tmpProperty3 = "aaa"
    }
    
    //有参构造器 并且内部和外部参数名都有 并且内部和外部参数名称不同
    init(firstPorper num1: Int, secondProper num2: Int) {
        self.tmpProper = num1
        self.tmpProper1 = num2
        self.tmpProperty3 = "aaa"
    }
    
    //有参构造器 没有外部参数名
    init(_ num1: Int, _ num2: Int) {
        self.tmpProper = num1
        self.tmpProper1 = num2
        self.tmpProperty3 = "aaa"
    }
    
    //指定构造器 类中最主要的构造器
    init(num1: Int, num2: Int, num3: Int) {
        self.tmpProper = num1
        self.tmpProper1 = num2
        self.tmpProperty3 = "aaa"
    }
    
    //遍历构造器 简单构造 或者调用指定构造器
    convenience init(num: Int) {
        self.init(num1: num, num2: 0, num3: 0)
    }
    
    func show() {
        print(tmpProper, tmpProper1, tmpProperty3!)
    }
}

//MARK:重载父类构造器
class TmpClass1: NSObject {
    override init() {
        super.init()
        print("父类构造器重载")
    }
}

//MARK:可失败构造器
class TmpClass2 {
    var tmpProper = "aaaa"
    
    //类的可失败构造器
    init?(tmpStr: String) {
        if tmpStr.isEmpty {
            return nil
        }
        self.tmpProper = tmpStr
    }
    
    //类的可失败构造器的另一种格式
    init!(tmpStr2: String) {
        if tmpStr2.isEmpty {
            return nil
        }
        self.tmpProper = tmpStr2
    }
    
    //枚举类型可失败构造器
    init?(tmpStr1: String) {
        switch tmpStr1 {
        case "aaa":
            self.tmpProper = "a"
        case "bbb":
            self.tmpProper = "b"
        default:
            return nil
        }
    }
}

//MARK:析构
class TmpClass4 {
    var tmpProper = 1
    
    init(num: Int) {
        self.tmpProper = num
    }
    
    deinit {
        print("TmpClass4 我走了")
    }
    
}

class CodeTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        grammarTest() //基本语法练习
//        mutableNumParaTest(members: 1)
//        mutableNumParaTest(members: "a", "b")
//        var num1 = 1
//        var num2 = 2
//        referencePara(num1: &num1, num2: &num2)
//        let tmpStr = funcNest(yourStr: "美丽")
//        print(tmpStr())
//        print(funcNest(yourStr: "美丽")())
//        print(makeIncrementor(forIncrement: 1)())
//        structTest()
//        classTest()
//        print(TmpClass5().tmpProperty, TmpClass5().tmpProper1, TmpClass5().tmpMethod())
//        var tmpObj = Struct1()
//        print(tmpObj.property1)
//        tmpObj.show()
        
        //MARK:协议合成测试
        /*
         let tmpObj = class1()
         tmpObj.show(person: tmpObj)
         */
        
        //MARK:泛型
        /*
         //泛型交换测试
         let tmpObj = class2()
         var a = 1
         var b = 2
         print(a, b)
         tmpObj.swapTwoValues(value1: &a, value2: &b)
         print(a, b)
         
         //泛型栈测试
         var tmpStack = stack1<String>()
         print(tmpStack.items)
         tmpStack.push("aaaa")
         tmpStack.push("bbbb")
         print(tmpStack.items)
         print(tmpStack.pop())
         print(tmpStack.items)
         
         //泛型拓展测试
         var tmpStack = stack1<Int>()
         tmpStack.push(1)
         tmpStack.push(2)
         print(tmpStack.items, tmpStack.topItem!)
         
         //泛型where
         var tmpStack1 = stack1<Int>()
         tmpStack1.push(1)
         tmpStack1.push(2)
         var tmpStack2 = stack1<Int>()
         tmpStack2.push(1)
         tmpStack2.push(2)
         print(allItemsMatch(tmpStack1, tmpStack2))
         */
   
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 基本语法练习
    func grammarTest() {
        
        //MARK: 注释
        //单行注释
        /*
         多行注释
         多行注释
         */
        
        //MARK:;问题
        /*
         * 单行多语句必须使用
         * 多行单语句不需要使用
         * 建议参考官方采用不使用的方式编写代码
         */
        
        //MARK: 空格问题
        /*
         * 正确写法
         let a = 1
         let a = 1 + 2
         * 错误写法 写错ide会报错
         let a = 1+ 2
         let a= 1
         */
        
        //MARK: 字面量
        /*
         例如1 编译器就会认为这个数值是一个整形数据类型即整形字面量
         3.1111 //浮点字面量
         "fffff" //字符串字面量
         true //布尔型字面量
         
         * 整形字面量
            * 17 十进制整形字面量
            * 0b10001 二进制整形字面量
            * 0o21 八进制整形字面量
            * 0x11 十六进制整形字面量
         * 浮点型字面量
            * let decimalDouble = 12.1875       //十进制浮点型字面量
            * let exponentDouble = 1.21875e1    //十进制浮点型字面量
            * let hexadecimalDouble = 0xC.3p0   //十六进制浮点型字面量
         * 字符型字面量
            * 需要注意特殊字符转义问题
         */
        
        //MARK: 打印
        /*
         print("Runoob") // 输出 Runoob
         */
        
        //MARK: 接收用户输入 目前在纯命令行下面可以用 模拟器以及真机无法使用 不知道具体原因
        /*
         let theInput = readLine()
         print(userInput as Any)
         */
    
        //MARK: 数据类型
        /*
         var
         
         * 基本数据类型
         Int
         UInt
         Double
         Float
         Bool
         
         * 其他类型
         * Optional（简写？）：用于处理值缺失情况，可选类型 建议提供一种默认值
            * 下面两种方式含义相同
            var tmpNum:Int?
            var tmpNum:Optional<Int>
            * 注意optional的范围
                * 正确写法：(Int[])? 错误写法：Int[]?
            * 强制解析（!）
                * 当一个可选有确定值时可以使用强制解析为某个特定数据类型
                * 示例代码
         var tmpStr:String?
         tmpStr = "1"
         if tmpStr != nil {
         print(tmpStr!)
         }else{
         print("lalllalalalal")
         }
         
         * 不为空的可选 打印是some("aaaaaa")
         var tmpStr:String!
         tmpStr = "aaaaaa"
         if tmpStr != nil {
         print(tmpStr)
         }else{
         print("dfasdfs")
         }
         
         * 可选绑定
         var tmpStr:String?
         tmpStr = "aaaaa"
         if let tmpStr1 = tmpStr {
         print("bbbbb\(tmpStr1)")
         }
         
         
         * Array,
         * Dictionary,
         * Struct,
         * Class
         
         * 类型别名
         typealias IntNewName = Int
         
         * 类型安全
         swift在编译时会确认变量类型 防止变量赋值错误等问题出现
         
         * 类型推断
         swift在编译时会根据字面量类型推断变量数据类型，例如整数会被默认为Int型，浮点数会默认为Double类型
         */
        
        
        //MARK：常量
        /*
         let
         * 类型标注
         let a:Int = 1
         print(a)
         */
        
        //MARK: 运算符
        /*
         * 算数运算符：
         +
         -
         *
         /
         %
         注意swift中没有++ --
         
         * 比较运算符
         ==
         !=
         >
         <
         >=
         <=
         
         * 逻辑运算符
         &&
         ||
         !
         
         * 位运算符
         ~:取反
         &:都为1时才为1
         |:有1则1
         ^：相同为0 不同为1
         <<：每一位左移
         >>：每一位右移
         
         * 赋值运算符
         =
         +=
         -=
         *=
         /=
         %=
         <<=
         >>=
         &=
         ^=
         |=
         
         * 区间运算符
         闭区间:1...5 (1, 2, 3, 4, 5)
         半开区间：1..<5(1, 2, 3, 4)
         
         * 其他运算符
            * 一元运算符：-1 +1
            * 二元运算符：1 + 2
            * 三元运算符：1 > 2 ? 1 : 2
         
         */
        
        //MARK: 条件语句
        /*
         if
         if else
         if else if else
         switch
         三元运算符
         */
        
        
        //MARK:循环
        /*
         for-in
         while
         repeat while
         continue
         break
         fallthrough :如果在一个case执行完后，继续执行下面的case，需要使用fallthrough(贯穿)关键字
         */
        
        //MARK:字符串
        /*
         //创建字符串
         _ = "aaa"
         
         //创建空字符串
         _ = ""
         
         //字符串拼接
         var tmpStr2 = "aaaaa"
         tmpStr2 += "bbbbb"
         print(tmpStr2)
         
         //字符串中插入值
         var tmpStr3 = "ccccc"
         let tmpNum = 1
         tmpStr3 = "aaa\(tmpStr3)bbb\(tmpNum)cccc"
         print(tmpStr3)
         
         //字符串长度
         let tmpStr = "123456"
         print("length:\(tmpStr.count)")
         
         //其他编码格式
         let tmpStr = "aaaaa"
         for code in tmpStr.utf8 {
         print(code)
         }
         for code in tmpStr.utf16 {
         print(code)
         }
         for code in tmpStr.utf8CString {
         print(code)
         }
         
         //字符串常用函数
         //判断是否为空
         let tmpStr = "aaa"
         print(tmpStr.isEmpty)
         
         特定前缀
         let tmpStr = "aaaa"
         let tmpBoolValue = tmpStr.hasPrefix("aaa")
         print(tmpBoolValue)
         
         //类型转化
         let tmpStr = "1111"
         let tmpNum:Int? = Int(tmpStr)
         print(tmpNum!)
         */
        
        //MARK: 字符
        /*
         * 声明字符
         let tmpCha:Character = "a"
         print(tmpCha, "\(tmpCha)")
         
         * 遍历字符
         let tmpStr = "abdf"
         for code in tmpStr {
         print(code)
         }
         
         * 字符串拼接字符
         let tmpStr = "aaa"
         let tmpCha = "b"
         let tmpStr1 = tmpStr + tmpCha
         print(tmpStr1)
         */
        
        
        //MARK:数组
        /*
         //创建数组
         let tmpArr = [Int]()
         let tmpArr = [Int](repeating: 0, count: 3)
         print(tmpArr)
         print(tmpArr[0])
         
         //插入 删除
         var tmpArr = [Int]()
         tmpArr.append(10)
         print(tmpArr)
         tmpArr += [20]
         print(tmpArr)
         tmpArr.remove(at: 1)
         print(tmpArr)
         
         //数组遍历
         let tmpArr = [1, 2, 3, 4]
         for num in tmpArr {
         print(num)
         }
         */
        
        //MARK:字典
        /*
         //创建字典
         let tmpDic = [Int:String]()
         var tmpDic1 = [1:"1", 2:"2"]
         print(tmpDic, tmpDic1)
         //访问某个值
         print(tmpDic1[1]!)
         //修改
         tmpDic1.updateValue("3", forKey: 1)
         print(tmpDic1)
         //增加
         tmpDic1.updateValue("5", forKey: 5)
         print(tmpDic1)
         //删除
         tmpDic1.removeValue(forKey: 1)
         print(tmpDic1)
         print(tmpDic1)
         //遍历字典
         for (myKey, myValue) in tmpDic {
         print(myKey, myValue)
         }
         //字典转数组
         var tmpDic = [1:"1", 2:"2"]
         for myKey in [Int](tmpDic.keys) {
         print(myKey)
         }
         for myValue in [String](tmpDic.values) {
         print(myValue)
         }
         */
        
        //MARK:闭包
        /*
         创建并使用闭包
         let tmpClosure = {print("fasdfasf")}
         tmpClosure()
         let tmpClosure1 = {(num1:Int, num2:Int) -> Int in
         return num1 + num2
         }
         print(tmpClosure1(1, 2))
         
         //数组排序
         var tmpArr = ["a", "b", "d", "c", "e", "f"]
         print(tmpArr)
         tmpArr = tmpArr.sorted(by: <)
         print(tmpArr)
         
         var tmpArr = ["a", "b", "d", "c", "e", "f"]
         print(tmpArr)
         tmpArr = tmpArr.sorted(by: { $0 > $1 })
         print(tmpArr)
         
         var tmpArr = ["a", "b", "d", "c", "e", "f"]
         print(tmpArr)
         tmpArr = tmpArr.sorted() { $0 > $1 }
         print(tmpArr)
         
         */
        
        //MARK:函数内实现代码块的方式
        /*
         func insideFuncTest(){
         print("我在里面")
         }
         let tmpClosure = {print("我也在里面")}
         insideFuncTest()
         tmpClosure()
         */
        
        //MARK:类型转换
        /*
         as? 返回一个可选值
         as! 强制形式的类型转换
         AnyObject可以代表任何class类型的实例
         Any可以表示任何类型，包括方法类型（function types）
         */
        
        
    }
    
    //MARK: 函数
    /*
     func：函数声明
     funcTest:函数名
     firstPara:参数标签
     num:参数名称
     Int：参数数据类型
     Bool：返回值类型
     */
    func funcTest(firstPara num:Int, secondPara num1:Int) -> Bool {
        return true
    }
    
    //MARK:可变参数
    /*
     参数中的每个元素类型需相同
     */
    func mutableNumParaTest<N>(members: N...) {
        print(members)
    }
    
    //MARK:引用函数参数
    func referencePara(num1:inout Int, num2:inout Int) {
        print(num1, num2)
        let tmp:Int = num1
        num1 = num2
        num2 = tmp
        print(num1, num2)
    }
    
    //MARK:函数嵌套
    func funcNest(yourStr:String) -> () -> String {
        var tmpStr = "me"
        func funcNestNes() -> String {
            return tmpStr + yourStr
        }
        return funcNestNes
        
    }
    
    func makeIncrementor(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementor() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementor
    }
    
    //枚举测试
    func enumTest() {
        
        //此时打印结果为 学生的成绩是: 98,97,95。 可以枚举相关值
        _ = Student.Name("Runoob")
        let studMarks = Student.Mark(98,97,95)
        switch studMarks {
        case .Name(let studName):
            print("学生的名字是: \(studName)。")
        case .Mark(let Mark1, let Mark2, let Mark3):
            print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
        }
        
        //打印结果为：数字月份为: 5。
        let yearMonth = Month.May.rawValue
        print("数字月份为: \(yearMonth)。")
    }
    
    //结构体测试
//    func structTest() {
//        let marks = studentMarks()
//        print(marks.mark1)
//        let mark1 = MarksStruct(mark: 8)
//        print(mark1)
//    }
    
    func classTest() {
        //MARK:创建一个自定义类 并使用其中的功能
        /*
         let tmpObj = CodeTestObject()
         print(tmpObj.tmpName)
         
         let tmpObj1 = MyClass()
         print(tmpObj1.myClassName)
         */
        
        
        //MARK:恒等运算符
        /*
         let tmpObj2 = CodeTestObject()
         let tmpObj3 = tmpObj2
         if tmpObj2 === tmpObj3 {
         print("是引用了同一个实例对象")
         }
         if tmpObj2 !== tmpObj3 {
         print("两个引用了不同的实例对象")
         }
         */
 
        //MARK: 类属性相关
        /*
         setter getter方法测试
         let tmpObj = CodeTestObject()
         print(tmpObj.tmpStr)
         tmpObj.tmpStr = "1111"
         print(tmpObj.tmpStr)
         
         //只读属性测试
         print(tmpObj.onlyReadValue)
         
         //属性观察期测试
         tmpObj.monitorProper = 100
         
         //类型属性测试
         print(CodeTestObject.tmpClassProperty)
         print(CodeTestObject.tmpSecondClassProperty)
         */
        
        //MARK: 实例方法测试
        /*
         let testObj = CodeTestObject()
         testObj.increment()
         print(testObj.myClassCount)
         testObj.incrementBy(count: 10)
         print(testObj.myClassCount)
         testObj.resetClassCount()
         print(testObj.myClassCount)
         */
        
        //MARK:实例方法中修改值类型测试
        /*
         var areaObj = area(areaName: "fasdfsadfsd")
         areaObj.updateAreaName(newAreaName: "aaaaaaa")
         */
   
        
        //MARK:类型方法测试
        /*
         CodeTestObject.classMethodTest()
         CodeTestObject.classMethodTest2()
         */

        //MARK:下标测试
        /*
         let tmpObj = CodeTestObject()
         print(tmpObj[1])
         print(tmpObj[2])
         print(tmpObj[3])
         */

        //MARK:循环引用问题
        /*
         两个对象互相强引用解决方式
         unowned let stname: Student
         weak var topic: Module?
         闭包强引用解决方式
         [unowned self] in
         */
        
        //MARK:类拓展
        /*
         let tmpObj = ViewController()
         print(tmpObj.myName)
         */

        //MARK:继承测试
        /*
         let aStu = StudentDetail(h: 180, name: "swift", mark1: 90, mark2: 100)
         print(aStu.heigth!)
         print(aStu.name!)
         print(aStu.mark1!)
         print(aStu.mark2!)
         
         //直接调用父类方法测试
         let tmpQuangang = Quangang()
         tmpQuangang.show()
         
         //重写的父类方法测试
         let tmpQuangang = Quangang()
         tmpQuangang.show()
         
         //重写父类属性测试
         let tmpObj = Quangang()
         print(tmpObj.tmpProper)
         
         //重写属性观察器测试
         let tmpObj = Quangang()
         tmpObj.tmpProper1 = "bbbbb"
         */
        
        //MARK:构造器测试
        /*
         //无参构造器
         let tmpObj = TmpClass()
         tmpObj.show()
         
         //有参构造器 有内部和外部参数名 并且内部外部参数名相同
         let tmpObj = TmpClass(num1: 100, num2: 200)
         tmpObj.show()
         
         //有参构造器 有不同的内部和外部参数名
         let tmpObj = TmpClass(firstPorper: 100, secondProper: 200)
         tmpObj.show()
         
         //有参构造器 没有外部参数名
         let tmpObj = TmpClass(100, 200)
         tmpObj.show()
         
         //结构体会有一个逐一成员构造器
         let tmpStruct = studentMarks(mark1: 100, mark2: 100, mark3: 100)
         print(tmpStruct)
         
         //结构体构造器代理
         let tmpStruct = studentMarks(num: 100)
         print(tmpStruct)
         */
        
        //MARK:析构函数测试
        /*
         let tmpObj = TmpClass4(num: 100)
         print(tmpObj)
         */
        
        //MARK:拓展
        /*
         //拓展构造器测试
         let tmpStruct = TmpStruct1(num: 100)
         print(tmpStruct)
         
         //拓展方法测试
         extensionVcMethod()
         
         //拓展可变实例方法测试
         var a = 10
         a.updateInt()
         print(a)
         
         //拓展下标
         print(self[1])
         */
        
        
    }
    
    //MARK:泛型 where
    func allItemsMatch<C1:protocol8, C2:protocol8>(_ container1: C1, _ container2: C2) -> Bool where C1.itemType == C2.itemType, C1.itemType: Equatable {
        if container1.count != container2.count {
            return false
        }
        
        for i in 0..<container1.count {
            if container1[i] != container2[i] {
                return false
            }
        }
        
        return true
    }

}

//MARK:协议

protocol Protocol1 {
    var tmpProper1: Int { get set }
}

protocol Protocol2 : Protocol1 {
    func tmpMethod() -> Int
}

class TmpClass5: NSObject, Protocol1, Protocol2 {
    var tmpProperty = 1
    var tmpProper1: Int = 2
    func tmpMethod() -> Int {
        return 1000
    }
}

//MARK:协议中的Mutating
protocol Protocol3 {
    mutating func show()
}

struct Struct1: Protocol3 {
    var property1 = 1
    mutating func show() {
        property1 = 2
        print(property1)
    }
}

//MARK:构造器协议 注意要添加关键字 required
protocol Protocol4 {
    init(num: Int)
}

protocol Protocol5 {
    func testMethod()
}

class Class1:Protocol4 {
    var property1 = 1
    
    required init(num: Int) {
        self.property1 = num
    }
}

//MARK:拓展遵守协议
extension UIViewController : Protocol5 {
    func testMethod() {
        print("拓展遵守协议")
    }
}

//MARK:协议合成
protocol protocol6 {
    var property1: Int { get set }
}

protocol protocol7 {
    var property2: Int { get set }
}

class class1: protocol6, protocol7 {
    var property1: Int = 1
    var property2: Int = 2
    
    //MARK:协议合成
    func show(person: protocol6 & protocol7) {
        print(person.property1, person.property2)
    }
}

//MARK:检查是否遵守某个协议
/*
 let objectWithArea = object as? HasArea
 */

//MARK:泛型
//泛型交换两个数
class class2 {
    func swapTwoValues<V>(value1: inout V, value2: inout V) {
        let tmpValue = value1
        value1 = value2
        value2 = tmpValue
    }
}

//泛型实现栈
struct stack1<V>: protocol8 {
    var items = [V]()

    mutating func push(_ item: V) {
        self.items.append(item)
    }
    
    mutating func pop() -> V {
        return items.removeLast()
    }
    
    //协议关联类型
    mutating func append(_ item: V) {
        self.items.append(item)
    }
    
    var count: Int {
        return self.items.count
    }
    
    subscript(index: Int) -> V {
        return self.items[index]
    }
}

//泛型拓展
extension stack1 {
    var topItem: V? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
}

//泛型关联类
protocol protocol8 {
    associatedtype itemType
    mutating func append(_ item: itemType)
    var count: Int { get }
    subscript(index: Int) -> itemType { get }
}

//MARK:访问控制



