//
//  CipherEncryption.swift
//  CipherEncryption
//
//  Created by rayhaanalykhan on 08/05/2024.
//
//  MIT License
//
//  Copyright (c) 2024 rayhaanalykhan
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

import Foundation
import CommonCrypto

// Extension for 'String' to facilitate cryptographic operations
public extension String {
    
    // Computed property to instantiate a CipherEncryption object for the string.
    var ce: CipherEncryption {
        return CipherEncryption(baseString: self)
    }
}

// CipherEncryption class to handle encryption procedures
final public class CipherEncryption {
    
    private let baseString: String  // Stores the original string to be encrypted
    
    // Initializer that takes the string to be encrypted
    init(baseString: String) {
        self.baseString = baseString
    }
    
    // Computed property to generate a SHA1 hash of the baseString
    public var sha1: String {
        
        // Ensure the string can be converted to UTF8 data
        guard let inputData = baseString.data(using: .utf8) else {
            return ""
        }
        
        // Create an array to hold the hash output
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        
        // Generate the hash using CommonCrypto functions
        _ = inputData.withUnsafeBytes {
            CC_SHA1($0.baseAddress, CC_LONG(inputData.count), &hash)
        }
        
        // Map the hash bytes to a hex string and concatenate them
        let hashedString = hash.map { String(format: "%02hhx", $0) }.joined()
        
        return hashedString
    }
    
    // Computed property to generate a SHA256 hash of the baseString
    public var sha256: String {
        
        // Ensure the string can be converted to UTF8 data
        guard let inputData = baseString.data(using: .utf8) else {
            return ""
        }
        
        // Create an array to hold the hash output
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        
        // Generate the hash using CommonCrypto functions
        _ = inputData.withUnsafeBytes {
            CC_SHA256($0.baseAddress, CC_LONG(inputData.count), &hash)
        }
        
        // Map the hash bytes to a hex string and concatenate them
        let hashedString = hash.map { String(format: "%02hhx", $0) }.joined()
        
        return hashedString
    }
}
