//
//  UsersViewModel.swift
//  KarooooDemo
//
//  Created by Muzaffar on 03/01/23.
//

import Foundation

class UsersViewModel{
    
    var usersData =  [User]()
    
    func fetchUserDetailscompletion(completion: @escaping (String) -> Void){
        
        NetworkService.shared.dataRequest(with: CTConstans.usersAPIURL, objectType: [User].self) { [self] (result: Result) in
            
            switch result {
            case .success(let object):
                usersData.append(contentsOf: object)
                completion(APIConstant.apiMsgSuccess)
            case .failure(let error):
                switch error {
                case .dataNotFound:
                    completion(APIConstant.apiMsgNoData)
                case .networkError:
                    completion(APIConstant.apiMsgNoInternet)
                case .jsonParsingError:
                    completion(APIConstant.apiMsgParseFailed)
                case .invalidStatusCode:
                    completion("\(APIConstant.apiMsgParseFailed): \(error.localizedDescription)")
                }
            }
        }
    }
}
