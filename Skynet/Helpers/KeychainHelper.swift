//
//  KeychainHelper.swift
//  Skynet
//
//  Created by Lais Godinho on 16/08/22.
//

import Foundation

final class KeychainHelper {
    static let standard = KeychainHelper()
    private init() {
        
    }
    
    func save(_ data: Data, service: String, account: String) {
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        
        if status != errSecSuccess {
            let duplicateItemStatusCode = -25299
            
            if status == duplicateItemStatusCode {
                let attributesToUpdate = [kSecValueData: data] as CFDictionary
                
                SecItemUpdate(query, attributesToUpdate)
            } else {
                print("Error: \(status)")
            }
        }
    }
    
    func read(service: String, account: String) -> Data? {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
    
    func delete(service: String, account: String) {
        let query = [
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        SecItemDelete(query)
    }
}
