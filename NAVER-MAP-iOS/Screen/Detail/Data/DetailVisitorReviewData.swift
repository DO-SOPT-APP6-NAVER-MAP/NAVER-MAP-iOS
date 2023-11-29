//
//  DetailVisitorReviewData.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/25/23.
//

import UIKit

struct DetailVisitorReviewData {
    let reviewImg, userImg: UIImage?
    let reviewContent, reviewImgCnt, userName, visitDate, visitCnt, visitorReviewType: String
}

extension DetailVisitorReviewData {
    static let detailVisitorDummy: [DetailVisitorReviewData] = [
        DetailVisitorReviewData(reviewImg: UIImage(named: "img_top_big"), 
                                userImg: ImageLiterals.ic_walk,
                                reviewContent: "로제 파스타 꾸덕하고 찐해서 진짜 맛있었어요! 봉골레도 간이 잘 돼서 맛있게 먹고 왔어요!ㅎㅎ  ",
                                reviewImgCnt: "2",
                                userName: "슬슬슬!",
                                visitDate: "10.22.일",
                                visitCnt: "2",
                                visitorReviewType: "영수증"),
        DetailVisitorReviewData(reviewImg: UIImage(named: "img_top_big"),
                                userImg: ImageLiterals.ic_walk,
                                reviewContent: "로제 파스타 꾸덕하고 찐해서 진짜 맛있었어요! 봉골레도 간이 잘 돼서 맛있게 먹고 왔어요!ㅎㅎ  ",
                                reviewImgCnt: "2",
                                userName: "슬슬슬!",
                                visitDate: "10.22.일",
                                visitCnt: "2",
                                visitorReviewType: "영수증"),
        DetailVisitorReviewData(reviewImg: UIImage(named: "img_top_big"),
                                userImg: ImageLiterals.ic_walk,
                                reviewContent: "로제 파스타 꾸덕하고 찐해서 진짜 맛있었어요! 봉골레도 간이 잘 돼서 맛있게 먹고 왔어요!ㅎㅎ  ",
                                reviewImgCnt: "2",
                                userName: "슬슬슬!",
                                visitDate: "10.22.일",
                                visitCnt: "2",
                                visitorReviewType: "영수증"),
        DetailVisitorReviewData(reviewImg: UIImage(named: "img_top_big"),
                                userImg: ImageLiterals.ic_walk,
                                reviewContent: "로제 파스타 꾸덕하고 찐해서 진짜 맛있었어요! 봉골레도 간이 잘 돼서 맛있게 먹고 왔어요!ㅎㅎ  ",
                                reviewImgCnt: "2",
                                userName: "슬슬슬!",
                                visitDate: "10.22.일",
                                visitCnt: "2",
                                visitorReviewType: "영수증"),
        DetailVisitorReviewData(reviewImg: UIImage(named: "img_top_big"),
                                userImg: ImageLiterals.ic_walk,
                                reviewContent: "로제 파스타 꾸덕하고 찐해서 진짜 맛있었어요! 봉골레도 간이 잘 돼서 맛있게 먹고 왔어요!ㅎㅎ  ",
                                reviewImgCnt: "2",
                                userName: "슬슬슬!",
                                visitDate: "10.22.일",
                                visitCnt: "2",
                                visitorReviewType: "영수증")
    ]
}
