//
//  CreditReportNetwork.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//

import Foundation

typealias Response = (CreditScoreinfo?, Error?) -> Void

class CreditReportNetwork : ObservableObject {
    
    private let decoder = JSONDecoder()
    
    private var apiURL : String
    
    private let session: URLSession
    
    init(apiURL: String = Config.General.url, session: URLSession = .shared) {
        self.session = session
        self.apiURL = apiURL
    }
    
    public func performRequest(completion: @escaping Response) {
        // make the call
        let task = session.dataTask(with:  URL(string: apiURL)!) { (data, response, error) in
          guard let data = data else {
            completion(nil, error)
            return
          }
          
          if data.count == 0 {
            completion(nil, error)
            return
          }
        
          do {
                let jsonDecoder = JSONDecoder()
                let values = try jsonDecoder.decode(CreditScoreinfo.self, from: data)
                
                // to make sure, the score is not nil
                guard values.creditReportInfo?.score != nil else {
                    completion(nil, NSError(domain: "", code: 1010, userInfo: [ NSLocalizedDescriptionKey: "Unknown error occured"]))
                    return
                }                
                completion(values, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
