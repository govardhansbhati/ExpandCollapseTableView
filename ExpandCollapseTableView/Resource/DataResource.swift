//
//  DataResource.swift
//  ExpandCollapseTableView
//
//  Created by govardhan singh on 17/09/21.
//

import Foundation

struct DataResource {
    func getDemoList()->[DemoDataList]{
       return [DemoDataList(title: "Alphabet", list: ["A","B", "C", "D", "E", "F"], isCollapsed: true), DemoDataList(title: "Number", list: ["1","2", "3", "4", "5", "6"], isCollapsed: true)]
   }
}
