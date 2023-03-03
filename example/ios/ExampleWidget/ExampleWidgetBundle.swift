//
//  ExampleWidgetBundle.swift
//  ExampleWidget
//
//  Created by Arne Molland on 01/03/2023.
//

import WidgetKit
import SwiftUI

@main
struct ExampleWidgetBundle: WidgetBundle {
    var body: some Widget {
        ExampleWidget()
        ExampleWidgetLiveActivity()
    }
}
