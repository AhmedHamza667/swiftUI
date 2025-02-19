//
//  GridViewModel.swift
//  firstUIProject
//
//  Created by Ahmed Hamza on 2/18/25.
//

import Foundation


class GridViewModel{
    var items: [GridItem] = [GridItem(label: "Jan", imageName: "1.lane.ar"), GridItem(label: "Feb", imageName: "2.lane.ar"), GridItem(label: "Mar", imageName: "3.lane.ar"), GridItem(label: "Apr", imageName: "4.lane.ar"), GridItem(label: "May", imageName: "5.lane.ar"), GridItem(label: "Jun", imageName: "6.lane.ar"), GridItem(label: "Jul", imageName: "7.lane.ar"), GridItem(label: "Aug", imageName: "8.lane.ar"), GridItem(label: "Sep", imageName: "9.lane.ar"), GridItem(label: "Oct", imageName: "10.lane.ar"), GridItem(label: "Nov", imageName: "11.lane.ar"), GridItem(label: "Dec", imageName: "12.lane.ar")]
    func numberOfItems() -> Int{
        return items.count
    }
    func getItem(at index: Int) -> GridItem{
        return items[index]
    }
    
}
