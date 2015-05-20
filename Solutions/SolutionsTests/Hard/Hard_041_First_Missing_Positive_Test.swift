//
//  Hard_041_First_Missing_Positive_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/20/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_041_First_Missing_Positive_Test: XCTestCase {
    private static let ProblemName: String = "Hard_041_First_Missing_Positive"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value + 100
    func test_001() {
        var input: [Int] = [1, 2, 0]
        var expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Int] = [3,4,-1,1]
        var expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Int] = []
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Int] = [-999]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Int] = [9, 8, 7, 6, 5, 4, 3, 2, 1]
        var expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Int] = [9, 8, 7, 6, 5, 4, 3, 2]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        var input: [Int] = [2, 3, 4, 5, 6, 7, 8, 9]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        var input: [Int] = [1, 1, 1, 0, -1, -2, 2, 9, 8, 3, 5, 4, 4, 1, 1, 6, -2, -9, 7, 7, 7]
        var expected: Int = 10
        asyncHelper(input: input, expected: expected)
    }
    func test_010() {
        var input: [Int] = [1, 1, 1, 0, -1, -2, 2, 9, 8, 5, 4, 4, 1, 1, 6, -2, -9, 7, 7, 7]
        var expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_011() {
        var input: [Int] = [1, 1, 1, 1]
        var expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_012() {
        var input: [Int] = [-1, -1, -1, -1]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    func test_013() {
        var input: [Int] = [2, 2, 2, 2]
        var expected: Int = 1
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(# input: [Int], expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Hard_041_First_Missing_Positive_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: Int = Hard_041_First_Missing_Positive.firstMissingPositive(input)
            assertHelper(expected == result, problemName: Hard_041_First_Missing_Positive_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Hard_041_First_Missing_Positive_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Hard_041_First_Missing_Positive_Test.ProblemName, input: input, resultValue: Hard_041_First_Missing_Positive_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
