//
//  ShareViewController.swift
//  CustomSave
//
//  Created by Anna Volkova on 12.11.2020.
//  Copyright © 2020 Anna Volkova. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        return true
    }
    
    override func didSelectPost() {
        let attachments = (self.extensionContext?.inputItems.first as? NSExtensionItem)?.attachments ?? []
        let contentType = kUTTypeData as String
        for provider in attachments {
            if provider.hasItemConformingToTypeIdentifier(contentType) {
                provider.loadItem(forTypeIdentifier: contentType, options: nil) { [weak self] (data, error) in
                    guard let strongify = self else { return }
                    guard error == nil else {
                        print(error?.localizedDescription ?? "")
                        return
                    }
                    if let text = data as? String {
                        strongify.save(text, key: "text")
                    } else {
                        print("Failed to save text")
                    }
                }}
        }
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        return []
    }
      
    private func save(_ data: String, key: String) {
        let userDefaults = UserDefaults(suiteName: "group.Anna-Volkova.SuffixAnalysis")
        userDefaults?.set(data, forKey: key)
        userDefaults?.synchronize()
    }
}
