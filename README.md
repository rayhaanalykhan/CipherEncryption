# CipherEncryption

A Swift library for cryptographic operations using encryption algorithms.

## Features

- Support for encrypting strings using common encryption algorithms.
- Simplified API for easy encryption operations.

## Installation

### Swift Package Manager (SPM) using Xcode

To integrate SwiftStrideIO into your Xcode project using Swift Package Manager, follow these steps:

1. Open your project in Xcode.
2. Navigate to the menu bar and click `File` > `Swift Packages` > `Add Package Dependency...`.
3. In the search bar of the new window that appears, paste the following URL: `https://github.com/rayhaanalykhan/CipherEncryption.git`
4. Follow the on-screen instructions to choose the package options and the version you want to integrate.
5. Once completed, Xcode will download the package and add it to your project navigator.

## Usage

To use CipherEncryption in your project, you will typically follow these steps:

1. **Encrypt using computed properties:**

    Encrypt the string using one of encryption algorithm eg: SHA-256.

    ```swift
    
    let someString = "someString"
        
    if let encryptedString = someString.ce.SHA256 {
            print(encryptedString)
            
    } else {
            print("Could not encrypt this: '\(someString)' in SHA256")
    }
    ```

2. **Encrypt using encrypt function:**

    Similary you can use the encrypt function to encrypt the string.
   
    ```swift
        let someString = "someString"
        
        if let encryptedString = someString.encrypt(.SHA1) { // ce = CipherEncryption
            print(encryptedString)
            
        } else {
            print("Could not encrypt this: '\(someString)' in SHA256")
        }
    ```

Using function is more feasible in some cases, you can use the enum defined on String class extension and pass it in a function.
[Example](https://github.com/rayhaanalykhan/SwiftStrideIO/blob/main/Sources/SwiftStrideIO/SwiftStrideIO.swift), here it is used in a different module, using function will provide the user with any future cases.     


## License

SwiftStrideIO is released under the MIT License. See the [LICENSE](LICENSE) file for further details.

## Contribution

Contributors are welcomed to fork the project and submit pull requests. Please include unit tests if possible for any new or existing functionality. Also, update the README accordingly.

## Contact

For further information, contact rayhaanalykhan at their [GitHub profile](https://github.com/rayhaanalykhan).
