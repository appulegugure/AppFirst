//
//  ViewController.swift
//  AppFirst
//
//  Created by アップルググれ on 2019/06/26.
//  Copyright © 2019 アップルググ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //nodeの識別子
    enum nodeNo:Int {
        case start = 0, end = 1000
        case one = 1, two = 2, three = 3, four = 4, five = 5, six = 6
        case secondOne = 11,secondTwo = 12
        case tOne = 13,tTwo = 14,tThree = 15,tFour = 16,tFive = 17, tSix = 18
        case fOne = 19,fTwo = 20,fThree = 21,fFour = 22
    }
    //streetの宣言
    var streetArreayStart:[Int] = [10,20,30,39,32,39]
    var streetArreay1:[Int] = [19,15,17,21,12,23,33,22,123,311,13,222]
    var streetArreay2:[Int] = [123,212,471,134,233]
    var streetArreay3:[Int] = [1021,1233,1123,1111,1003,1311,1067,1320]
    var streetArreay4:[Int] = [12,54,178]
    var streetArreayEnd: [Int] = [100,29]
    //nodeクラスの宣言
    class nodeInformation:Hashable {
        var hashValue: Int {
            return nodeNo.rawValue
        }
        var nodeValue:Int = 0
        var nodeNo:nodeNo = .one
        var arreay = [Int]()
        var returnMin:Int?{
            get{
                return arreay.min()
            }
        }
        func addArreay(addValue:Int) -> Void{
            arreay.append(addValue)
        }
        static func == (lhs: nodeInformation, rhs: nodeInformation) -> Bool {
            return lhs.nodeNo.rawValue == rhs.nodeNo.rawValue
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    

    

}

