//
//  OnBoardModel.swift
//  ExpensesTracker
//
//  Created by Priyank Gandhi on 17/05/24.
//

import Foundation
import UIKit

struct OnBoardModel: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var headerText: String
    var subHeaderText: String
    var displayAction: Bool = false
}

var pageIntro: [OnBoardModel] = [
    OnBoardModel(introAssetImage: "control_money", headerText: "Gain total control of your money", subHeaderText: "Become your own money manager and make every cent count", displayAction: true),
    OnBoardModel(introAssetImage: "money_goes", headerText: "Know where your money goes", subHeaderText: "Track your transaction easily, with categories and financial report ", displayAction: true),
    OnBoardModel(introAssetImage: "planning_ahead", headerText: "Planning ahead", subHeaderText: "Setup your budget for each category so you in control", displayAction: true)
]
