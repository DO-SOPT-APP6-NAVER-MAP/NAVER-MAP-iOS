//
//  ImageLiterals.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

enum ImageLiterals {
    
    // MARK: - Normal Icon
    
    static var ic_arrow_left_and: UIImage { .load(name: "ic_arrow_left_and") }
    static var ic_food: UIImage { .load(name: "ic_food") }
    static var ic_home_and: UIImage { .load(name: "ic_home_and") }
    static var ic_menu_and: UIImage { .load(name: "ic_menu_and") }
    static var ic_arrow_down: UIImage { .load(name: "icons=ic_arrow_down") }
    static var ic_arrow_left_g6: UIImage { .load(name: "icons=ic_arrow_left_g6") }
    static var ic_arrow_right: UIImage { .load(name: "icons=ic_arrow_right") }
    static var ic_call_thick: UIImage { .load(name: "icons=ic_call_thick") }
    static var ic_car: UIImage { .load(name: "icons=ic_car") }
    static var ic_menu: UIImage { .load(name: "icons=ic_menu") }
    static var ic_mic: UIImage { .load(name: "icons=ic_mic") }
    static var ic_navigation: UIImage { .load(name: "icons=ic_navigation") }
    static var ic_remove: UIImage { .load(name: "icons=ic_remove") }
    static var ic_riding: UIImage { .load(name: "icons=ic_riding") }
    static var ic_road: UIImage { .load(name: "icons=ic_road") }
    static var ic_search: UIImage { .load(name: "icons=ic_search") }
    static var ic_share: UIImage { .load(name: "icons=ic_share") }
    static var ic_star_thick: UIImage { .load(name: "icons=ic_star_thick") }
    static var ic_subway: UIImage { .load(name: "icons=ic_subway") }
    static var ic_walk: UIImage { .load(name: "icons=ic_walk") }
    
    // MARK: - Finding Route Icon

    static var ic_change: UIImage { .load(name: "icons=ic_change") }
    static var ic_pin_bg: UIImage { .load(name: "icons=ic_pin_bg") }
    static var ic_share_bg: UIImage { .load(name: "icons=ic_share_bg") }
    static var ic_star: UIImage { .load(name: "icons=ic_star") }
    static var ic_bus_white: UIImage { .load(name: "ic_btn_bus_white") }
    static var bus_info_btn: UIImage { .load(name: "btn_bus_info_ios") }
    static var tap_choice_transport_ios: UIImage { .load(name: "tap_choice_transport_ios") }
    static var ic_dropdown_circle: UIImage { .load(name: "ic_dropdown_circle") }

    // MARK: - Detail Icon

    static var ic_btn_location_white: UIImage { .load(name: "ic_btn_location_white") }
    static var ic_picture: UIImage { .load(name: "ic_picture") }
    static var ic_alarm: UIImage { .load(name: "icons=ic_alarm") }
    static var ic_btn_depart_circle: UIImage { .load(name: "icons=ic_btn_depart_circle") }
    static var ic_call: UIImage { .load(name: "icons=ic_call") }
    static var ic_clock: UIImage { .load(name: "icons=ic_clock") }
    static var ic_copy_1: UIImage { .load(name: "icons=ic_copy-1") }
    static var ic_copy: UIImage { .load(name: "icons=ic_copy") }
    static var ic_current_location: UIImage { .load(name: "icons=ic_current_location") }
    static var ic_home: UIImage { .load(name: "icons=ic_home") }
    static var ic_information: UIImage { .load(name: "icons=ic_information") }
    static var ic_location_remove: UIImage { .load(name: "icons=ic_location_remove") }
    static var ic_naverbooking_24: UIImage { .load(name: "icons=ic_naverbooking_24") }
    static var ic_naverbooking: UIImage { .load(name: "icons=ic_naverbooking") }
    static var ic_navercal: UIImage { .load(name: "icons=ic_navercal") }
    static var ic_naverorder_24: UIImage { .load(name: "icons=ic_naverorder_24") }
    static var ic_naverorder: UIImage { .load(name: "icons=ic_naverorder") }
    static var ic_navigation_circle: UIImage { .load(name: "icons=ic_navigation_circle") }
    static var ic_star_fill: UIImage { .load(name: "icons=ic_star_fill") }
    static var ic_star_red: UIImage { .load(name: "icons=ic_star_red") }
    static var ic_webpage: UIImage { .load(name: "icons=ic_webpage") }
    static var ic_write: UIImage { .load(name: "icons=ic_write") }
    static var ic_arrow_right_16: UIImage { .load(name: "icons=ic_arrow_right_16") }
    static var ic_number_circle: UIImage { .load(name: "ic_number_circle") }
    static var ic_to_go: UIImage { .load(name: "icons=ic_to_go") }
    static var review_bar_1: UIImage { .load(name: "bar_review1")}
    static var review_bar_2: UIImage { .load(name: "bar_review2")}
    static var review_bar_3: UIImage { .load(name: "bar_review3")}

    // MARK: - Search Location Icon

    static var ic_select_location_blue: UIImage { .load(name: "icons=ic_ select_location_blue") }
    static var ic_select_location: UIImage { .load(name: "icons=ic_ select_location") }
    static var ic_location_and: UIImage { .load(name: "icons=ic_location_and") }
    static var ic_location_ios: UIImage { .load(name: "icons=ic_location_ios") }
    static var ic_refresh: UIImage { .load(name: "icons=ic_refresh") }
    static var ic_spead: UIImage { .load(name: "icons=ic_spead") }
    static var ic_up_arrrow_left: UIImage { .load(name: "icons=ic_up_arrrow_left") }

    // MARK: - Image Icon

    static var img_beating_heart: UIImage { .load(name: "img_beating_heart") }
    static var img_dining_code: UIImage { .load(name: "img_dining_code") }
    static var img_drooling_face: UIImage { .load(name: "img_drooling_face") }
    static var img_search_big: UIImage { .load(name: "img_search_big") }
    static var img_thumbs_up: UIImage { .load(name: "img_thumbs_up") }
    
    // MARK: - Captions
    
    static var caption_naverbooking: UIImage { .load(name: "caption_naverbooking") }
    static var caption_naverorder: UIImage { .load(name: "caption_naverorder") }
    static var caption_naverpay: UIImage { .load(name: "caption_naverpay") }

}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
}
