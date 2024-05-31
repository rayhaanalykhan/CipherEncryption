# CipherEncryption

A Swift library for cryptographic operations using encryption algorithms.

## Features

- Support for encrypting strings using common encryption algorithms.
- Simplified API for easy encryption operations.

## Algorithms List
1. SHA1
2. SHA224
3. SHA256
4. SHA384
5. SHA512

## Installation

### Swift Package Manager (SPM) using Xcode

To integrate SwiftStrideIO into your Xcode project using Swift Package Manager, follow these steps:

1. Open your project in Xcode.
2. Navigate to the menu bar and click `File` > `Swift Packages` > `Add Package Dependency...`.
3. In the search bar of the new window that appears, paste the following URL: `https://github.com/rayhaanalykhan/CipherEncryption.git`
4. Follow the on-screen instructions to choose the package options and the version you want to integrate.
5. Once completed, Xcode will download the package and add it to your project navigator.

## Usage

To use CipherEncryption into your project, you can utilize the following approaches:

1. **Encrypt using computed properties:**

    Encrypt the string using one of encryption algorithm eg: SHA-256.

    ```swift
    
    let someString = "someString"
        
    if let encryptedString = someString.ce.SHA256 { // ce = CipherEncryption
        print(encryptedString)    
    } else {
        print("Could not encrypt this: '\(someString)' in SHA256")
    }
    ```
    ```swift
    // Alternate
    print("someString".ce.SHA1 ?? "Couldn't be encrypted")
    ```

2. **Encrypt using encrypt function:**

    Similary you can use the encrypt function to encrypt the string.
   
    ```swift
    let someString = "someString"
        
    if let encryptedString = someString.encrypt(.SHA1) {
        print(encryptedString)  
    } else {
        print("Could not encrypt this: '\(someString)' in SHA256")
    }
    ```
    ```swift
    // Alternate
    print("someString".encrypt(.SHA1) ?? "Couldn't be encrypted")
    ```

Using function is more feasible in some cases, you can use the enum defined on String class extension and pass it in a function.
[Example](https://github.com/rayhaanalykhan/SwiftStrideIO/blob/main/Sources/SwiftStrideIO/SwiftStrideIO.swift), here it is used in a different module, using function will provide the user with any future cases.     


## License

CipherEncryption is released under the MIT License. See the [LICENSE](https://github.com/rayhaanalykhan/CipherEncryption/blob/main/LICENSE.md) file for further details.

## Contribution

Contributors are welcomed to fork the project and submit pull requests. Please include unit tests if possible for any new or existing functionality. Also, update the README accordingly.

## Contact

For further information, contact me via email [rayhaanalykhan@gmail.com](mailto:rayhaanalykhan@gmail.com).
