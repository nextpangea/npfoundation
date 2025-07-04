//
//  DiagnosticsTests.mm
//  npfoundation
//
//  Created by Jonathan Lee on 6/22/25.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <XCTest/XCTest.h>
#import <NPFoundation/NPFoundation.h>

using namespace NP;

@interface DiagnosticsTests : XCTestCase

@end

@implementation DiagnosticsTests

- (void)testNode {
    Diagnostics diagnostics;
    diagnostics.note("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

- (void)testPrefixNode {
    Diagnostics diagnostics{"test"};
    diagnostics.note("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

- (void)testWarning {
    Diagnostics diagnostics;
    diagnostics.warning("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

- (void)testPrefixWarning {
    Diagnostics diagnostics{"test"};
    diagnostics.warning("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

- (void)testVerboseWarning {
    Diagnostics diagnostics{"test", stderr, true};
    diagnostics.warning("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

- (void)testError {
    Diagnostics diagnostics;
    diagnostics.error("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertTrue(diagnostics.hasError());
    XCTAssertFalse(diagnostics.noError());
    diagnostics.clearError();
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

- (void)testPrefixError {
    Diagnostics diagnostics{"test"};
    diagnostics.error("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertTrue(diagnostics.hasError());
    XCTAssertFalse(diagnostics.noError());
    diagnostics.clearError();
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

- (void)testVerboseError {
    Diagnostics diagnostics{"test", stderr, true};
    diagnostics.error("%fs", CFAbsoluteTimeGetCurrent());
    XCTAssertTrue(diagnostics.hasError());
    XCTAssertFalse(diagnostics.noError());
    diagnostics.clearError();
    XCTAssertFalse(diagnostics.hasError());
    XCTAssertTrue(diagnostics.noError());
}

@end
