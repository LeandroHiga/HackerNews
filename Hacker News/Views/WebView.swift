//
//  WebView.swift
//  Hacker News
//
//  Created by Lean Caro on 05/08/2020.
//  Copyright © 2020 Leandro Higa. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable { //UIViewRepresentable so we can use UIKit
    
    let urlString: String?
    
    //Delegate method to conform the protocol
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    //Delegate method to conform the protocol
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString { //Check if urlString is not nil
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
