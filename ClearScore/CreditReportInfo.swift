//
//  CreditReportInfo.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//


import Foundation
struct CreditReportInfo : Codable, Equatable {
	var score : Int?
	var scoreBand : Int?
	var clientRef : String?
	var status : String?
	var maxScoreValue : Int?
	var minScoreValue : Int?
	var monthsSinceLastDefaulted : Int?
	var hasEverDefaulted : Bool?
	var monthsSinceLastDelinquent : Int?
	var hasEverBeenDelinquent : Bool?
	var percentageCreditUsed : Int?
	var percentageCreditUsedDirectionFlag : Int?
	var changedScore : Int?
	var currentShortTermDebt : Int?
	var currentShortTermNonPromotionalDebt : Int?
	var currentShortTermCreditLimit : Int?
	var currentShortTermCreditUtilisation : Int?
	var changeInShortTermDebt : Int?
	var currentLongTermDebt : Int?
	var currentLongTermNonPromotionalDebt : Int?
	var currentLongTermCreditLimit : String?
	var currentLongTermCreditUtilisation : String?
	var changeInLongTermDebt : Int?
	var numPositiveScoreFactors : Int?
	var numNegativeScoreFactors : Int?
	var equifaxScoreBand : Int?
	var equifaxScoreBandDescription : String?
	var daysUntilNextReport : Int?

	enum CodingKeys: String, CodingKey {

		case score = "score"
		case scoreBand = "scoreBand"
		case clientRef = "clientRef"
		case status = "status"
		case maxScoreValue = "maxScoreValue"
		case minScoreValue = "minScoreValue"
		case monthsSinceLastDefaulted = "monthsSinceLastDefaulted"
		case hasEverDefaulted = "hasEverDefaulted"
		case monthsSinceLastDelinquent = "monthsSinceLastDelinquent"
		case hasEverBeenDelinquent = "hasEverBeenDelinquent"
		case percentageCreditUsed = "percentageCreditUsed"
		case percentageCreditUsedDirectionFlag = "percentageCreditUsedDirectionFlag"
		case changedScore = "changedScore"
		case currentShortTermDebt = "currentShortTermDebt"
		case currentShortTermNonPromotionalDebt = "currentShortTermNonPromotionalDebt"
		case currentShortTermCreditLimit = "currentShortTermCreditLimit"
		case currentShortTermCreditUtilisation = "currentShortTermCreditUtilisation"
		case changeInShortTermDebt = "changeInShortTermDebt"
		case currentLongTermDebt = "currentLongTermDebt"
		case currentLongTermNonPromotionalDebt = "currentLongTermNonPromotionalDebt"
		case currentLongTermCreditLimit = "currentLongTermCreditLimit"
		case currentLongTermCreditUtilisation = "currentLongTermCreditUtilisation"
		case changeInLongTermDebt = "changeInLongTermDebt"
		case numPositiveScoreFactors = "numPositiveScoreFactors"
		case numNegativeScoreFactors = "numNegativeScoreFactors"
		case equifaxScoreBand = "equifaxScoreBand"
		case equifaxScoreBandDescription = "equifaxScoreBandDescription"
		case daysUntilNextReport = "daysUntilNextReport"
	}
    
    init(score: Int) {
        self.score = score
    }
	
    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		score = try values.decodeIfPresent(Int.self, forKey: .score)
		scoreBand = try values.decodeIfPresent(Int.self, forKey: .scoreBand)
		clientRef = try values.decodeIfPresent(String.self, forKey: .clientRef)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		maxScoreValue = try values.decodeIfPresent(Int.self, forKey: .maxScoreValue)
		minScoreValue = try values.decodeIfPresent(Int.self, forKey: .minScoreValue)
		monthsSinceLastDefaulted = try values.decodeIfPresent(Int.self, forKey: .monthsSinceLastDefaulted)
		hasEverDefaulted = try values.decodeIfPresent(Bool.self, forKey: .hasEverDefaulted)
		monthsSinceLastDelinquent = try values.decodeIfPresent(Int.self, forKey: .monthsSinceLastDelinquent)
		hasEverBeenDelinquent = try values.decodeIfPresent(Bool.self, forKey: .hasEverBeenDelinquent)
		percentageCreditUsed = try values.decodeIfPresent(Int.self, forKey: .percentageCreditUsed)
		percentageCreditUsedDirectionFlag = try values.decodeIfPresent(Int.self, forKey: .percentageCreditUsedDirectionFlag)
		changedScore = try values.decodeIfPresent(Int.self, forKey: .changedScore)
		currentShortTermDebt = try values.decodeIfPresent(Int.self, forKey: .currentShortTermDebt)
		currentShortTermNonPromotionalDebt = try values.decodeIfPresent(Int.self, forKey: .currentShortTermNonPromotionalDebt)
		currentShortTermCreditLimit = try values.decodeIfPresent(Int.self, forKey: .currentShortTermCreditLimit)
		currentShortTermCreditUtilisation = try values.decodeIfPresent(Int.self, forKey: .currentShortTermCreditUtilisation)
		changeInShortTermDebt = try values.decodeIfPresent(Int.self, forKey: .changeInShortTermDebt)
		currentLongTermDebt = try values.decodeIfPresent(Int.self, forKey: .currentLongTermDebt)
		currentLongTermNonPromotionalDebt = try values.decodeIfPresent(Int.self, forKey: .currentLongTermNonPromotionalDebt)
		currentLongTermCreditLimit = try values.decodeIfPresent(String.self, forKey: .currentLongTermCreditLimit)
		currentLongTermCreditUtilisation = try values.decodeIfPresent(String.self, forKey: .currentLongTermCreditUtilisation)
		changeInLongTermDebt = try values.decodeIfPresent(Int.self, forKey: .changeInLongTermDebt)
		numPositiveScoreFactors = try values.decodeIfPresent(Int.self, forKey: .numPositiveScoreFactors)
		numNegativeScoreFactors = try values.decodeIfPresent(Int.self, forKey: .numNegativeScoreFactors)
		equifaxScoreBand = try values.decodeIfPresent(Int.self, forKey: .equifaxScoreBand)
		equifaxScoreBandDescription = try values.decodeIfPresent(String.self, forKey: .equifaxScoreBandDescription)
		daysUntilNextReport = try values.decodeIfPresent(Int.self, forKey: .daysUntilNextReport)
	}

}
