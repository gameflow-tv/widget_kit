//
//  ExampleWidgetBundle.swift
//  ExampleWidget
//
//  Created by Arne Molland on 01/03/2023.
//

import SwiftUI
import WidgetKit

@main
struct ExampleWidgetBundle: WidgetBundle {
  var body: some Widget {
    ExampleWidget()
    ExampleWidgetLiveActivity()
  }
}
