//
//  Config.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//

import UIKit

struct Config {
    struct General {
        static let url          = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
        static let fontName     = "HelveticaNeue-Light"
        static let titleTxt     = "Your credit score is"
        static let subTitletxt  = "out of 700"
    }
    
    struct Color {
        static let background   = UIColor.white
        static let trackStroke  = UIColor.rgb(r: 56, g: 25, b: 49)
        static let scoreFont    = UIColor.rgb(r: 245, g: 230, b: 153)
        static let Gradientfrom  = UIColor.rgb(r: 243, g: 181, b: 116)
        static let Gradientto   = UIColor.rgb(r: 243, g: 224, b: 129)
    }
}
