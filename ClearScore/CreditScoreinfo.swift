//
//  CreditScoreinfo.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//

import Foundation
struct CreditScoreinfo : Codable {
	let accountIDVStatus : String?
	let creditReportInfo : CreditReportInfo?
	let dashboardStatus : String?
	let personaType : String?
	let coachingSummary : CoachingSummary?
	let augmentedCreditScore : String?

	enum CodingKeys: String, CodingKey {

		case accountIDVStatus = "accountIDVStatus"
		case creditReportInfo = "creditReportInfo"
		case dashboardStatus = "dashboardStatus"
		case personaType = "personaType"
		case coachingSummary = "coachingSummary"
		case augmentedCreditScore = "augmentedCreditScore"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accountIDVStatus = try values.decodeIfPresent(String.self, forKey: .accountIDVStatus)
		creditReportInfo = try values.decodeIfPresent(CreditReportInfo.self, forKey: .creditReportInfo)
		dashboardStatus = try values.decodeIfPresent(String.self, forKey: .dashboardStatus)
		personaType = try values.decodeIfPresent(String.self, forKey: .personaType)
		coachingSummary = try values.decodeIfPresent(CoachingSummary.self, forKey: .coachingSummary)
		augmentedCreditScore = try values.decodeIfPresent(String.self, forKey: .augmentedCreditScore)
	}
}
