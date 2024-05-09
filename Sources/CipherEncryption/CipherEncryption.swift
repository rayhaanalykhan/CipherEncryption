//
//  CipherEncryption.swift
//
//  Created by rayhaanalykhan on 08/05/2024.
//
//  This file is part of SwiftStrideIO. For licensing information, see the LICENSE file.
//

import Foundation
import CommonCrypto

// Extension for 'String' to facilitate cryptographic operations
public extension String {
    
    // Enumeration defining different encryption algorithms
    enum Encryption {
        
        case SHA1
        case SHA224
        case SHA256
        case SHA384
        case SHA512
    }
    
    /// Encrypts the string using the specified encryption algorithm.
    ///
    /// - Parameter encryption: The encryption algorithm to use.
    /// - Returns: The encrypted string, or nil if encryption fails.
    func encrypt(_ encryption: Encryption) -> String? {
        
        switch encryption {
            
        case .SHA1:
            return ce.SHA1
            
        case .SHA224:
            return ce.SHA224
            
        case .SHA256:
            return ce.SHA256
            
        case .SHA384:
            return ce.SHA384
            
        case .SHA512:
            return ce.SHA512
        }
    }
    
    /// Computed property to instantiate a `CipherEncryption` object for the string.
    var ce: CipherEncryption {
        return CipherEncryption(baseString: self)
    }
}

// CipherEncryption class to handle encryption procedures
public class CipherEncryption {
    
    private let baseString: String  // Stores the original string to be encrypted
    
    // Initializer that takes the string to be encrypted
    init(baseString: String) {
        self.baseString = baseString
    }
    
    public var SHA1: String? { // Computed property to generate a SHA1 hash of the baseString
        return generateSHA(length: CC_SHA1_DIGEST_LENGTH)
    }
    
    public var SHA224: String? { // Computed property to generate a SHA224 hash of the baseString
        return generateSHA(length: CC_SHA224_DIGEST_LENGTH)
    }
    
    public var SHA256: String? { // Computed property to generate a SHA256 hash of the baseString
        return generateSHA(length: CC_SHA256_DIGEST_LENGTH)
    }
    
    public var SHA384: String? { // Computed property to generate a SHA384 hash of the baseString
        return generateSHA(length: CC_SHA384_DIGEST_LENGTH)
    }
    
    public var SHA512: String? { // Computed property to generate a SHA512 hash of the baseString
        return generateSHA(length: CC_SHA512_DIGEST_LENGTH)
    }
    
    // Computed property to generate a SHA (of given length) hash of the baseString
    private func generateSHA(length: Int32) -> String? {
        
        // Ensure the string can be converted to UTF8 data
        guard let inputData = baseString.data(using: .utf8) else {
            return nil
        }
        
        // Create an array to hold the hash output
        var hash = [UInt8](repeating: 0, count: Int(length))
        
        // Generate the hash using CommonCrypto functions
        
        switch length {
            
        case CC_SHA1_DIGEST_LENGTH:
            _ = inputData.withUnsafeBytes {
                CC_SHA1($0.baseAddress, CC_LONG(inputData.count), &hash)
            }
            
        case CC_SHA224_DIGEST_LENGTH:
            _ = inputData.withUnsafeBytes {
                CC_SHA224($0.baseAddress, CC_LONG(inputData.count), &hash)
            }
            
        case CC_SHA256_DIGEST_LENGTH:
            _ = inputData.withUnsafeBytes {
                CC_SHA256($0.baseAddress, CC_LONG(inputData.count), &hash)
            }
            
        case CC_SHA384_DIGEST_LENGTH:
            _ = inputData.withUnsafeBytes {
                CC_SHA384($0.baseAddress, CC_LONG(inputData.count), &hash)
            }
            
        case CC_SHA512_DIGEST_LENGTH:
            _ = inputData.withUnsafeBytes {
                CC_SHA1($0.baseAddress, CC_LONG(inputData.count), &hash)
            }
            
        default:
            return nil
        }
        
        // Map the hash bytes to a hex string and concatenate them
        let hashedString = hash.map { String(format: "%02hhx", $0) }.joined()
        
        return hashedString
    }
}
