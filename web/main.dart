// Copyright (c) 2016, ofadeyi. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.


import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:dart_angular2_tour_of_heroes/app_component.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:dart_angular2_tour_of_heroes/in_memory_data_service.dart';

main() {
  bootstrap(AppComponent,
      [ provide(Client, useClass: InMemoryDataService) ]
  // Using a real back end? Import browser_client.dart and change the above to
  // [provide(Client, useFactory: () => new BrowserClient(), deps: [])]
  );
}
