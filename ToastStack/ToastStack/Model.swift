//
//  Model.swift
//  ToastStack
//
//  Created by Yu Ming Yu on 10/31/26.
//

import Foundation

struct ToastMessage : Identifiable, Equatable {
	let id = UUID()
	
	var title : String
	var body : String
	
}

