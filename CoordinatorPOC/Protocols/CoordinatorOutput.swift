//
//  CoordinatorOutput.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import Foundation

protocol CoordinatorOutput {
	associatedtype Output
	
	var onFinishFlow: ((Output) -> Void)? { get set }
}
