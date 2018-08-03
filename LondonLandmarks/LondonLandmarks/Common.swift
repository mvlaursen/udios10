//
//  Common.swift
//  LondonLandmarks
//
//  Created by Mike Laursen on 8/2/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

struct CommonColors {
    static let LLBlue = UIColor(displayP3Red: 35/255, green: 90/255, blue: 141/255, alpha: 1.0)
}

struct LandmarkData {
    static let data: [LandmarkDataItem] = [
        LandmarkDataItem("Big Ben", imageName: "BigBen", streetAddress: "This is Big Ben."),
        LandmarkDataItem("London Eye", imageName: "LondonEye", streetAddress: "This is the London Eye")]
}

class LandmarkDataItem {
    public var imageName:String!
    public var streetAddress:String!
    public var title:String!
    
    public init(_ title: String!, imageName: String!, streetAddress: String!) {
        self.title = title
        self.streetAddress = streetAddress
        self.imageName = imageName
    }
}
