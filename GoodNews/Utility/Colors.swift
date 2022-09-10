//
//  Colors.swift
//  GoodNews
//
//  Created by user on 10/9/22.
//


import Foundation
import UIKit

struct Colors{
    static let appColor:String = "#13A89E"
    static let actionButtonColor:String = "#13A89E"
    static let border_color_gray:String = "#B9B9B9"
    static let divider_color_gray:String = "#f0f0f0"
    static let editable_color_gray:String = "#c7d0cc"

    
    static let basic_blue:String = "#1890FF"
    static let standard_green:String = "#12A89E"
    static let premium_orance:String = "#FF6F00"

    static let textfield_background = "#ededed"
    static let textfield_text_color = "#545454"
    static let button_background = "#00A1B0"
    static let popup_textview_color = "#0064b1"
    static let product_name_background = "#0064b1"
    static let arrow_color = "#939393"
    static let primary_bg = "#f9f9f9"
    static let product_header_bg = "#faffff"
    static let product_material_bg = "#ededed"
    static let suggested_item_bg = "#007783"

}

extension String{
    func uiColor () -> UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
   
}
