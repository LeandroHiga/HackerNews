//
//  DetalView.swift
//  Hacker News
//
//  Created by Lean Caro on 04/08/2020.
//  Copyright © 2020 Leandro Higa. All rights reserved.
//

import SwiftUI
import WebKit

struct DetalView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetalView_Previews: PreviewProvider {
    static var previews: some View {
        DetalView(url: "https://www.google.com")
    }
}

