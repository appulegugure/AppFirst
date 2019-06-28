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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let x:nodeInformation = nodeInformation()
        x.nodeNo = .start
        x.nodeValue = 0
        
        let node1:nodeInformation = nodeInformation()
        node1.nodeNo = .one
        node1.nodeValue = 0
        
        let node2:nodeInformation = nodeInformation()
        node2.nodeNo = .two
        node2.nodeValue = 0
        
        let node3:nodeInformation = nodeInformation()
        node3.nodeNo = .three
        node3.nodeValue = 0
        
        let node4:nodeInformation = nodeInformation()
        node4.nodeNo = .four
        node4.nodeValue = 0
        
        let node5:nodeInformation = nodeInformation()
        node5.nodeNo = .five
        node5.nodeValue = 0
        
        let node6:nodeInformation = nodeInformation()
        node6.nodeNo = .six
        node6.nodeValue = 0
        //セクション２　　 y , w   Goal z
        let y:nodeInformation = nodeInformation()
        y.nodeNo = .secondOne
        y.nodeValue = 0
        
        let w:nodeInformation = nodeInformation()
        w.nodeNo = .secondTwo
        w.nodeValue = 0
        
        //セクション３　Tone,Ttwo,Tthree,Tfour,Tfive,Tsix
        let Tone:nodeInformation = nodeInformation()
        w.nodeNo = .tOne
        w.nodeValue = 0
        
        let Ttwo:nodeInformation = nodeInformation()
        w.nodeNo = .tTwo
        w.nodeValue = 0
        
        let Tthree:nodeInformation = nodeInformation()
        w.nodeNo = .tThree
        w.nodeValue = 0
        
        let Tfour:nodeInformation = nodeInformation()
        w.nodeNo = .tFour
        w.nodeValue = 0
        
        let Tfive:nodeInformation = nodeInformation()
        w.nodeNo = .tFive
        w.nodeValue = 0
        
        let Tsix:nodeInformation = nodeInformation()
        w.nodeNo = .tSix
        w.nodeValue = 0
        //セクション4  Fone,Ftwo,Fthree,Ffour
        let Fone:nodeInformation = nodeInformation()
        w.nodeNo = .fOne
        w.nodeValue = 0
        
        let Ftwo:nodeInformation = nodeInformation()
        w.nodeNo = .fTwo
        w.nodeValue = 0
        
        let Fthree:nodeInformation = nodeInformation()
        w.nodeNo = .fThree
        w.nodeValue = 0
        
        let Ffour:nodeInformation = nodeInformation()
        w.nodeNo = .fFour
        w.nodeValue = 0
        //⭐︎Goal
        let z:nodeInformation = nodeInformation()
        z.nodeNo = .end
        z.nodeValue = 0
        
        //各nodeの宛先nodeの配列を宣言
        var nodeArreayToW:[nodeInformation] = [node1,node2,node3,node4,node5,node6]
        var nodeArreayToY:[nodeInformation] = [node1,node2,node3,node4,node5,node6]
        var nodeArreayToZ:[nodeInformation] = [y,w]
        
        //通らなくてはならないnodeの指定があった場合
        let tergetNode1:[nodeInformation] = [node1]
        let tergetNode2:[nodeInformation] = [x]
        
        
        let section1Node:Set<nodeInformation> = [node1,node2,node3,node4]
        let section2Node:Set<nodeInformation> = [x,y]
        
        let sdiff1 = section1Node.symmetricDifference(tergetNode1)
        let sdiff2 = section2Node.symmetricDifference(tergetNode2)
        
        
        switch  tergetNode1.isEmpty {
        case false :
            for plusCal_Node in sdiff1 {
                plusCal_Node.nodeValue += 10000
            }
            fallthrough
            
        case false :
            for plusCal_Node in sdiff2 {
                plusCal_Node.nodeValue += 10000
            }
        default:
            print("エラー")
        }
        
        //////////////
        if x.nodeNo == .start {
            for nodeStore in nodeArreayToY {
                if nodeStore.nodeNo == nodeNo.one{
                    //optional型へ足し算しているためのエラー
                    nodeStore.addArreay(addValue:streetArreayStart[0])
                    //Startの視点を変更して次のノードへ足し算する。層が多くなる毎に階層も深くなる。
                    for secondSection in nodeArreayToZ{
                        if secondSection.nodeNo == nodeNo.secondOne {
                            secondSection.addArreay(addValue: streetArreay1[0] + nodeStore.nodeValue)
                        }
                        else if secondSection.nodeNo == nodeNo.secondTwo{
                            secondSection.addArreay(addValue: streetArreay1[1] + nodeStore.nodeValue)
                        }
                    }
                }
                else if nodeStore.nodeNo == nodeNo.two {
                    nodeStore.addArreay(addValue: streetArreayStart[1])
                    //Startの視点を変更して次のノードへ足し算する。層が多くなる毎に階層も深くなる。
                    for secondSection in nodeArreayToZ{
                        if secondSection.nodeNo == nodeNo.secondOne {
                            secondSection.addArreay(addValue: streetArreay1[2] + nodeStore.nodeValue)
                        }
                        else if secondSection.nodeNo == nodeNo.secondTwo{
                            secondSection.addArreay(addValue: streetArreay1[3] + nodeStore.nodeValue)
                        }
                    }
                }
                else if nodeStore.nodeNo == nodeNo.three{
                    nodeStore.addArreay(addValue: streetArreayStart[2])
                    //Startの視点を変更して次のノードへ足し算する。層が多くなる毎に階層も深くなる。
                    for secondSection in nodeArreayToZ{
                        if secondSection.nodeNo == nodeNo.secondOne {
                            secondSection.addArreay(addValue: streetArreay1[4] + nodeStore.nodeValue)
                        }
                        else if secondSection.nodeNo == nodeNo.secondTwo{
                            secondSection.addArreay(addValue: streetArreay1[5] + nodeStore.nodeValue)
                        }
                    }
                }
                else if nodeStore.nodeNo == nodeNo.four{
                    nodeStore.addArreay(addValue: streetArreayStart[3])
                    //Startの視点を変更して次のノードへ足し算する。層が多くなる毎に階層も深くなる。
                    for secondSection in nodeArreayToZ{
                        if secondSection.nodeNo == nodeNo.secondOne {
                            secondSection.addArreay(addValue: streetArreay1[6] + nodeStore.nodeValue)
                        }
                        else if secondSection.nodeNo == nodeNo.secondTwo{
                            secondSection.addArreay(addValue:  streetArreay1[7] + nodeStore.nodeValue)
                        }
                    }
                }
                else if nodeStore.nodeNo == nodeNo.five{
                    nodeStore.addArreay(addValue: streetArreayStart[4])
                    //Startの視点を変更して次のノードへ足し算する。層が多くなる毎に階層も深くなる。
                    for secondSection in nodeArreayToZ{
                        if secondSection.nodeNo == nodeNo.secondOne {
                            secondSection.addArreay(addValue:  streetArreay1[8] + nodeStore.nodeValue)
                        }
                        else if secondSection.nodeNo == nodeNo.secondTwo{
                            secondSection.addArreay(addValue:  streetArreay1[9] + nodeStore.nodeValue)
                        }
                    }
                }
                else if nodeStore.nodeNo == nodeNo.six{
                    nodeStore.addArreay(addValue: streetArreayStart[5])
                    //Startの視点を変更して次のノードへ足し算する。層が多くなる毎に階層も深くなる。
                    for secondSection in nodeArreayToZ{
                        if secondSection.nodeNo == nodeNo.secondOne {
                            secondSection.addArreay(addValue: streetArreay1[10] + nodeStore.nodeValue)
                        }
                        else if secondSection.nodeNo == nodeNo.secondTwo{
                            secondSection.addArreay(addValue: streetArreay1[11] + nodeStore.nodeValue)
                        }
                    }
                }
                else {
                    print("エラー")
                }
            }
        }
        
        //ゲッターに帰ってくるのはoptional型であるため、アンラップ　演算子を使いたい場合は一旦アンラップする
        var minOfW = w.returnMin
        var minOfY = y.returnMin
        
        w.nodeValue = minOfW! + streetArreayEnd[0]
        y.nodeValue = minOfY! + streetArreayEnd[0]
        
        print(node1.nodeValue)
        print(node2.nodeValue)
        print(node3.nodeValue)
        print(node4.nodeValue)
        print(node5.nodeValue)
        print(node6.nodeValue)
        print(y.arreay)
        print(w.arreay)
        print(y.returnMin)
        print(w.returnMin)
        if z.nodeValue == 0 {
            for nodeStock in nodeArreayToZ{
                z.addArreay(addValue: nodeStock.nodeValue)
                //optionalのため比較演算子が適用できない　classのプロパティをIntに変えればyおい
            }
        }
        let score = z.returnMin
        z.nodeValue = score!
        
        print(z.nodeValue)
        // Do any additional setup after loading the view.
    }
    

    

}

