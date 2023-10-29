//
//  testData.swift
//  EcommarceFullApp
//
//  Created by Tipu on 27/10/23.
//

import Foundation

struct TestData {
    static let shared = TestData()
    
    let brandsData: [brands] = [
        brands(brandName: "Adidas", brandImage: "Adidas"),
        brands(brandName: "Fila", brandImage: "fila"),
        brands(brandName: "Nike", brandImage: "nike"),
        brands(brandName: "Brand 4", brandImage: "Adidas"),
        brands(brandName: "Fila", brandImage: "fila"),
        brands(brandName: "Nike", brandImage: "nike"),
        brands(brandName: "Adidas", brandImage: "Adidas"),
        brands(brandName: "Fila", brandImage: "fila"),
        brands(brandName: "Nike", brandImage: "nike")
    ]
    
    let categoryData: [category] = [
    
        category(image: "first", icon: "love", title: "Nike Sportswear Club Fleece", price: "$99"),
        category(image: "second", icon: "love", title: "Nike Sportswear Club Fleece", price: "$158"),
        category(image: "first", icon: "love", title: "Nike Sportswear Club Fleece", price: "$29"),
        category(image: "second", icon: "love", title: "Nike Sportswear Club Fleece", price: "$228"),
        category(image: "first", icon: "love", title: "Nike Sportswear Club Fleece", price: "$339"),
        category(image: "second", icon: "love", title: "Nike Sportswear Club Fleece", price: "$33"),
        category(image: "first", icon: "love", title: "Nike Sportswear Club Fleece", price: "$20"),
        category(image: "second", icon: "love", title: "Nike Sportswear Club Fleece", price: "$10")
    ]
}
