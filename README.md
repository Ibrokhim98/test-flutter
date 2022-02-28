# Test Flutter

Integrate the screens below as best as you can.

- Request the data from the route : https://raw.githubusercontent.com/popina/test-flutter/main/data.json.
- Parse the response.
- Add a loader and error handling in case the network is slow or API is down.
- You can use any package you might find useful and helpful.
- Structure with a design pattern.
- If you are a Swift developer, it would be a plus if you wrote part of the business logic in a Swift Package using [Platform channels](https://docs.flutter.dev/development/platform-integration/platform-channels). This Swift package would only have one method `getOrdersList() -> [Order]`. On the Dart side we would call this method via a platform channel and get the result in typed Dart (array of Orders). *If you don't have time to do this please tell us how you would to it. If you struggle to do this a clean way, please tell us about the problems you encountered.*

## Rules to follow

- Make a fork of this repository
- Separate all data management with a state management approach.
- You must commit regularly so we can follow your progress with an initial empty commit when you start the test
- If you can't finish this test, make sure you provide a minimal viable product and add comments about the next steps

## Deliverables

- The link to the git repository.
- Several commits, with an explicit message each time.
- A separate file or email documenting your process and principles you've followed.

![orders](https://raw.githubusercontent.com/popina/test-flutter/main/orders.png)
![items](https://raw.githubusercontent.com/popina/test-flutter/main/items.png)
