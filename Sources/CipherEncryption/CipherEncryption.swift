//
//  CipherEncryption.swift
//  CipherEncryption
//
//  Created by rayhaanalykhan on 08/05/2024.
//

import Foundation
import CommonCrypto

public extension String {
    
    var ce: CipherEncryption {
        return CipherEncryption(baseString: self)
    }
}

public class CipherEncryption {
    
    private let baseString: String
    
    init(baseString: String) {
        self.baseString = baseString
    }
    
    public var sha1: String {
        
        guard let inputData = baseString.data(using: .utf8) else {
            return ""
        }
        
        // Allocate array of unsigned 8-bit integers (UInt8) for the hash value
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        
        // Compute SHA-1 hash
        _ = inputData.withUnsafeBytes {
            // Update the hash value with the input data
            CC_SHA1($0.baseAddress, CC_LONG(inputData.count), &hash)
        }
        
        // Convert hashed value to string representation
        let hashedString = hash.map { String(format: "%02hhx", $0) }.joined()
        
        return hashedString
    }
    
    public var sha256: String {
        
        guard let inputData = baseString.data(using: .utf8) else {
            return ""
        }
        
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        
        _ = inputData.withUnsafeBytes {
            CC_SHA256($0.baseAddress, CC_LONG(inputData.count), &hash)
        }
        
        let hashedString = hash.map { String(format: "%02hhx", $0) }.joined()
        
        return hashedString
    }
}
