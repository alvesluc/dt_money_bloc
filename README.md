# Dt Money
[![License: MIT][license_badge]][license_link]

## About

This project was initially developed with React, in a event called Next Level Week, which is a intense week of free content with an amazing quality, then I've cloned it using Flutter with the same design that was first purposed, you can check it [here](https://github.com/alvesluc/dt_money).

Feature-wise, this is the same application, but now is fully tested and uses the combination of Material 3 and [Bloc](https://bloclibrary.dev/#/).

### Web version

![image](https://github.com/alvesluc/dt_money_bloc/assets/42820357/20ce9a04-537f-469c-9923-88cae4633fa7)

### Mobile version

![image](https://github.com/alvesluc/dt_money_bloc/assets/42820357/da96cc1c-9675-42ad-b6a1-a748fdb86fb9)

## Getting Started 🚀

Before runing:

```sh
flutter pub get
```

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

#### Development
```sh
flutter run --flavor development --target lib/main_development.dart
```

#### Staging
```sh
flutter run --flavor staging --target lib/main_staging.dart
```


#### Production
```sh
flutter run --flavor production --target lib/main_production.dart
```

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
